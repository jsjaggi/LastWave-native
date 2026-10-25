import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyrics.freezed.dart';
part 'lyrics.g.dart';

@freezed
class LyricSyllable with _$LyricSyllable {
  const factory LyricSyllable({
    required String text,
    required double offset,
    required double duration,
  }) = _LyricSyllable;

  factory LyricSyllable.fromJson(Map<String, dynamic> json) => _$LyricSyllableFromJson(json);
}

@freezed
class LyricLine with _$LyricLine {
  const factory LyricLine({
    required String text,
    required double offset,
    required double duration,
    required int syllableCount,
  }) = _LyricLine;

  factory LyricLine.fromJson(Map<String, dynamic> json) => _$LyricLineFromJson(json);
}

@freezed
class Lyrics with _$Lyrics {
  const factory Lyrics({
    required String trackId,
    required String language,
    required List<LyricLine> lines,
  }) = _Lyrics;

  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);
}