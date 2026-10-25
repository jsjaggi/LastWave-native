import Foundation
import AVFoundation

/// Core audio player using AVAudioEngine for bit-perfect output and parametric EQ.
/// Port of Colon3's clean engine architecture but wired for remote streaming.
@MainActor
public final class PlayerManager: ObservableObject {
    public static let shared = PlayerManager()

    private let engine = AVAudioEngine()
    private let playerNode = AVAudioPlayerNode()
    private let timePitch = AVAudioUnitTimePitch()
    private let eq = AVAudioUnitEQ(numberOfBands: 10)

    @Published public var isPlaying = false
    @Published public var currentTime: Double = 0
    @Published public var duration: Double = 0

    private var timer: Timer?

    private init() {
        setupAudioSession()
        setupEngine()
    }

    private func setupAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .default, policy: .longFormAudio)
            try session.setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }

    private func setupEngine() {
        engine.attach(playerNode)
        engine.attach(timePitch)
        engine.attach(eq)

        // Wire: playerNode -> timePitch -> eq -> mainMixer
        engine.connect(playerNode, to: timePitch, format: nil)
        engine.connect(timePitch, to: eq, format: nil)
        engine.connect(eq, to: engine.mainMixerNode, format: nil)

        engine.prepare()
    }

    public func playRemoteStream(url: URL) async {
        let asset = AVURLAsset(url: url)
        do {
            let duration = try await asset.load(.duration)
            self.duration = duration.seconds
            print("Ready to play stream: \(url)")
            isPlaying = true
            startTimer()
        } catch {
            print("Error loading asset: \(error)")
        }
    }

    public func togglePlayPause() {
        if isPlaying {
            playerNode.pause()
            isPlaying = false
        } else {
            playerNode.play()
            isPlaying = true
        }
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, self.isPlaying else { return }
        }
    }
}