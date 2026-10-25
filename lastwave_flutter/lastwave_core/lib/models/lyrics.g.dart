// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LyricSyllable _$LyricSyllableFromJson(Map<String, dynamic> json) =>
    _LyricSyllable(
      text: json['text'] as String,
      offset: (json['offset'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
    );

Map<String, dynamic> _$LyricSyllableToJson(_LyricSyllable instance) =>
    <String, dynamic>{
      'text': instance.text,
      'offset': instance.offset,
      'duration': instance.duration,
    };

_LyricLine _$LyricLineFromJson(Map<String, dynamic> json) => _LyricLine(
  text: json['text'] as String,
  offset: (json['offset'] as num).toDouble(),
  duration: (json['duration'] as num).toDouble(),
  syllableCount: (json['syllableCount'] as num).toInt(),
);

Map<String, dynamic> _$LyricLineToJson(_LyricLine instance) =>
    <String, dynamic>{
      'text': instance.text,
      'offset': instance.offset,
      'duration': instance.duration,
      'syllableCount': instance.syllableCount,
    };

_Lyrics _$LyricsFromJson(Map<String, dynamic> json) => _Lyrics(
  trackId: json['trackId'] as String,
  language: json['language'] as String,
  lines: (json['lines'] as List<dynamic>)
      .map((e) => LyricLine.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LyricsToJson(_Lyrics instance) => <String, dynamic>{
  'trackId': instance.trackId,
  'language': instance.language,
  'lines': instance.lines,
};
