import Foundation

/// Pure Swift client for YouTube Music's InnerTube API.
/// Provides catalog search, song metadata, and high-efficiency audio stream resolution (Opus / M4A).
public final class InnerTubeClient: Sendable {
    public static let shared = InnerTubeClient()

    private let session: URLSession
    private let clientName = "WEB_REMIX"
    private let clientVersion = "1.20241022.01.00"

    public struct SongItem: Identifiable, Sendable, Codable {
        public let id: String
        public let title: String
        public let artist: String
        public let album: String?
        public let durationSeconds: Int?
        public let artworkUrl: String?

        public init(id: String, title: String, artist: String, album: String?, durationSeconds: Int?, artworkUrl: String?) {
            self.id = id
            self.title = title
            self.artist = artist
            self.album = album
            self.durationSeconds = durationSeconds
            self.artworkUrl = artworkUrl
        }
    }

    public struct AudioStream: Sendable {
        public let url: URL
        public let mimeType: String
        public let bitrate: Int
        public let durationMs: Int64

        public init(url: URL, mimeType: String, bitrate: Int, durationMs: Int64) {
            self.url = url
            self.mimeType = mimeType
            self.bitrate = bitrate
            self.durationMs = durationMs
        }
    }

    public init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Search Catalog
    public func search(query: String) async throws -> [SongItem] {
        let endpoint = URL(string: "https://music.youtube.com/youtubei/v1/search?alt=json")!
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("https://music.youtube.com", forHTTPHeaderField: "Origin")

        let payload: [String: Any] = [
            "context": [
                "client": [
                    "clientName": clientName,
                    "clientVersion": clientVersion,
                    "hl": "en",
                    "gl": "US"
                ]
            ],
            "query": query,
            "params": "egWKAQIAWACABqgBAMgBAA==" // Music filter param
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: payload)

        let (data, response) = try await session.data(for: request)
        guard let httpRes = response as? HTTPURLResponse, httpRes.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try parseSearchResults(data: data)
    }

    // MARK: - Resolve Audio Stream
    public func resolveAudioStream(videoId: String) async throws -> AudioStream {
        let endpoint = URL(string: "https://music.youtube.com/youtubei/v1/player?alt=json")!
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload: [String: Any] = [
            "context": [
                "client": [
                    "clientName": "ANDROID_MUSIC",
                    "clientVersion": "6.42.52",
                    "hl": "en",
                    "gl": "US"
                ]
            ],
            "videoId": videoId,
            "playbackContext": [
                "contentPlaybackContext": [
                    "signatureTimestamp": 19800
                ]
            ]
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: payload)

        let (data, response) = try await session.data(for: request)
        guard let httpRes = response as? HTTPURLResponse, httpRes.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let streamingData = json?["streamingData"] as? [String: Any],
              let adaptiveFormats = streamingData["adaptiveFormats"] as? [[String: Any]] else {
            throw URLError(.cannotParseResponse)
        }

        // Prefer audio/webm (Opus) at highest bitrate, fallback to audio/mp4 (AAC)
        let audioFormats = adaptiveFormats.filter { format in
            let mime = format["mimeType"] as? String ?? ""
            return mime.contains("audio/")
        }.sorted { a, b in
            let bitrateA = a["averageBitrate"] as? Int ?? a["bitrate"] as? Int ?? 0
            let bitrateB = b["averageBitrate"] as? Int ?? b["bitrate"] as? Int ?? 0
            return bitrateA > bitrateB
        }

        guard let best = audioFormats.first,
              let urlString = best["url"] as? String,
              let url = URL(string: urlString),
              let mimeType = best["mimeType"] as? String else {
            throw URLError(.resourceUnavailable)
        }

        let bitrate = best["averageBitrate"] as? Int ?? best["bitrate"] as? Int ?? 160000
        let approxDurationMs = (best["approxDurationMs"] as? NSString)?.longLongValue ?? 0

        return AudioStream(url: url, mimeType: mimeType, bitrate: bitrate, durationMs: approxDurationMs)
    }

    // MARK: - Parsing Helpers
    private func parseSearchResults(data: Data) throws -> [SongItem] {
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let contents = json["contents"] as? [String: Any] else {
            return []
        }

        var results: [SongItem] = []
        // Recursive extraction for YouTube's deeply nested search response
        extractSongs(from: contents, into: &results)
        return results
    }

    private func extractSongs(from object: Any, into results: inout [SongItem]) {
        if let dict = object as? [String: Any] {
            if let videoId = dict["videoId"] as? String,
               let titleObj = dict["title"] as? [String: Any],
               let title = parseText(titleObj) {

                let artist = parseArtist(from: dict) ?? "Unknown Artist"
                let album = parseAlbum(from: dict)
                let artwork = parseArtwork(from: dict)

                results.append(SongItem(
                    id: videoId,
                    title: title,
                    artist: artist,
                    album: album,
                    durationSeconds: nil,
                    artworkUrl: artwork
                ))
            } else {
                for value in dict.values {
                    extractSongs(from: value, into: &results)
                }
            }
        } else if let array = object as? [Any] {
            for item in array {
                extractSongs(from: item, into: &results)
            }
        }
    }

    private func parseText(_ obj: [String: Any]) -> String? {
        if let runs = obj["runs"] as? [[String: Any]] {
            return runs.compactMap { $0["text"] as? String }.joined()
        }
        if let simple = obj["simpleText"] as? String {
            return simple
        }
        return nil
    }

    private func parseArtist(from dict: [String: Any]) -> String? {
        if let flex = dict["flexColumns"] as? [[String: Any]], flex.count > 1,
           let textObj = (flex[1]["musicResponsiveListItemFlexColumnRenderer"] as? [String: Any])?["text"] as? [String: Any],
           let runs = textObj["runs"] as? [[String: Any]] {
            return runs.first?["text"] as? String
        }
        return nil
    }

    private func parseAlbum(from dict: [String: Any]) -> String? {
        if let flex = dict["flexColumns"] as? [[String: Any]], flex.count > 2,
           let textObj = (flex[2]["musicResponsiveListItemFlexColumnRenderer"] as? [String: Any])?["text"] as? [String: Any],
           let runs = textObj["runs"] as? [[String: Any]] {
            return runs.first?["text"] as? String
        }
        return nil
    }

    private func parseArtwork(from dict: [String: Any]) -> String? {
        if let thumbnails = ((dict["thumbnail"] as? [String: Any])?["musicThumbnailRenderer"] as? [String: Any])?["thumbnail"] as? [String: Any],
           let list = thumbnails["thumbnails"] as? [[String: Any]],
           let url = list.last?["url"] as? String {
            return url
        }
        return nil
    }
}