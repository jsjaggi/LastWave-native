// Port of LyricsRepository.kt - Lyric line, syllable, and result models

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyrics.freezed.dart';
part 'lyrics.g.dart';

/// A single syllable/fragment in a karaoke lyric line
@freezed
abstract class LyricSyllable with _$LyricSyllable {
  const factory LyricSyllable({
    required int timeMs,
    required int durationMs,
    required String text,
    @Default(false) bool isBackground,
    /// True when this fragment continues the previous token with no space
    /// (Apple Music `part` words like "with"+"drawals")
    @Default(false) bool appendToPrevious,
  }) = _LyricSyllable;

  factory LyricSyllable.fromJson(Map<String, dynamic> json) =>
      _$LyricSyllableFromJson(json);
}

/// A synced lyric line with optional syllable timing
@freezed
abstract class LyricLine with _$LyricLine {
  const factory LyricLine({
    required int timeMs,
    @Default(0) int durationMs,
    required String text,
    @Default([]) List<LyricSyllable> syllables,
    String? transliteration,
    @Default([]) List<LyricSyllable> transliterationSyllables,
  }) = _LyricLine;

  factory LyricLine.fromJson(Map<String, dynamic> json) =>
      _$LyricLineFromJson(json);

  /// Convenience: line has syllable timing
  bool get hasSyllables => syllables.isNotEmpty;

  /// Convenience: check if text is RTL
  bool get isRtl => LyricLine.isRtlText(text) || syllables.any((s) => LyricLine.isRtlText(s.text));

  /// Check if text is right-to-left
  static bool isRtlText(String? text) {
    if (text == null || text.isEmpty) return false;
    var rtlCount = 0;
    var ltrCount = 0;
    String? firstStrongRtl;
    var i = 0;
    while (i < text.length) {
      final codeUnit = text.codeUnitAt(i);
      final directionality = _getDirectionality(codeUnit);
      if (directionality == _Directionality.rightToLeft ||
          directionality == _Directionality.rightToLeftArabic) {
        if (firstStrongRtl == null) firstStrongRtl = 'true';
        rtlCount++;
      } else if (directionality == _Directionality.leftToRight) {
        if (firstStrongRtl == null) firstStrongRtl = 'false';
        ltrCount++;
      }
      i++;
    }
    return firstStrongRtl == 'true' || (rtlCount > 0 && rtlCount >= ltrCount);
  }

  static int _getDirectionality(int codePoint) {
    // Simplified bidi directionality lookup
    if (codePoint >= 0x0590 && codePoint <= 0x08FF) return _Directionality.rightToLeft;
    if (codePoint >= 0x0600 && codePoint <= 0x06FF) return _Directionality.rightToLeftArabic;
    if (codePoint >= 0x0750 && codePoint <= 0x077F) return _Directionality.rightToLeft;
    if (codePoint >= 0x08A0 && codePoint <= 0x08FF) return _Directionality.rightToLeft;
    if (codePoint >= 0xFB50 && codePoint <= 0xFDFF) return _Directionality.rightToLeftArabic;
    if (codePoint >= 0xFE70 && codePoint <= 0xFEFF) return _Directionality.rightToLeftArabic;
    return _Directionality.leftToRight;
  }

  /// Background vocal text detection (parenthesized rows)
  static bool isBackgroundVocalText(String text) {
    final t = text.trim();
    if (t.length < 3 || !t.startsWith('(') || !t.endsWith(')')) return false;
    var depth = 0;
    for (var i = 0; i < t.length; i++) {
      if (t[i] == '(') {
        depth++;
      } else if (t[i] == ')') {
        depth--;
      }
      if (depth == 0) return i == t.length - 1;
    }
    return false;
  }

  /// Display form of a backing row: one outer paren pair off
  static String stripBackgroundParens(String text) {
    if (isBackgroundVocalText(text)) {
      final t = text.trim();
      return t.substring(1, t.length - 1).trim();
    }
    return text;
  }
}

/// Check if a line is a background vocal line
extension LyricLineEx on LyricLine {
  bool isBackgroundLine() => syllables.isNotEmpty && syllables.every((s) => s.isBackground);
}

/// Result of a lyrics lookup
@freezed
abstract class LyricsResult with _$LyricsResult {
  const factory LyricsResult.success({
    required List<LyricLine> lines,
    required bool isSynced,
    @Default(false) bool isWordSynced,
    String? plainLyrics,
    @Default(false) bool isInstrumental,
    String? source,
  }) = LyricsSuccess;

  const factory LyricsResult.empty() = LyricsEmpty;

  const factory LyricsResult.error(String message) = LyricsError;

  const LyricsResult._();

  bool get isRtl => this is LyricsSuccess ? (this as LyricsSuccess).isRtlText : false;

  bool get isRtlText {
    if (this is LyricsSuccess) {
      final s = this as LyricsSuccess;
      return s.lines.any((l) => l.isRtl) || (s.plainLyrics != null && LyricLine.isRtlText(s.plainLyrics));
    }
    return false;
  }
}

/// Lyrics provider enum - mirrors LyricsProvider from SettingsPreferences
enum LyricsProvider {
  auto('auto'),
  lastwave('lastwave'),
  lrcRed('lrc.red'),
  appleMusic('apple music'),
  betterLyrics('betterlyrics'),
  betterLyricsPortato('portato'),
  kugou('kugou'),
  biniLyrics('bini'),
  simpMusic('simp'),
  musixmatch('musixmatch'),
  lyricsPlus('lyricsplus'),
  unison('unison'),
  youtubeCaptions('youtube captions'),
  youtubeMusic('youtube music'),
  megalobiz('megalobiz'),
  spotify('spotify'),
  genius('genius'),
  lrclib('lrclib');

  final String id;
  const LyricsProvider(this.id);

  /// Map provider source string to enum (mirrors providerForSource in Kotlin)
  static LyricsProvider? fromSource(String? source) {
    if (source == null || source.isEmpty) return null;
    final s = source.toLowerCase();
    return switch (s) {
      _ when s.startsWith('lastwave') => LyricsProvider.lastwave,
      _ when s.startsWith('lrc.red') => LyricsProvider.lrcRed,
      _ when s.startsWith('apple music') => LyricsProvider.appleMusic,
      _ when s.startsWith('betterlyrics') => LyricsProvider.betterLyrics,
      _ when s.startsWith('qq karaoke') || s.startsWith('portato') => LyricsProvider.betterLyricsPortato,
      _ when s.startsWith('kugou') => LyricsProvider.kugou,
      _ when s.startsWith('syllable-sync') || s.startsWith('bini') => LyricsProvider.biniLyrics,
      _ when s.startsWith('video-match') || s.startsWith('simp') => LyricsProvider.simpMusic,
      _ when s.startsWith('catalog') || s.startsWith('musixmatch') => LyricsProvider.musixmatch,
      _ when s.startsWith('lrclib') => LyricsProvider.lrclib,
      _ when s.startsWith('lyricsplus') => LyricsProvider.lyricsPlus,
      _ when s.startsWith('unison') => LyricsProvider.unison,
      _ when s.startsWith('youtube captions') => LyricsProvider.youtubeCaptions,
      _ when s.startsWith('youtube music') => LyricsProvider.youtubeMusic,
      _ when s.startsWith('megalobiz') => LyricsProvider.megalobiz,
      _ when s.startsWith('spotify') => LyricsProvider.spotify,
      _ when s.startsWith('genius') => LyricsProvider.genius,
      _ => null,
    };
  }

  bool get isWordSyncProvider => switch (this) {
    LyricsProvider.betterLyrics ||
    LyricsProvider.beterLyricsPortato ||
    LyricsProvider.kugou ||
    LyricsProvider.biniLyrics ||
    LyricsProvider.simpMusic ||
    LyricsProvider.lyricsPlus ||
    LyricsProvider.unison ||
    LyricsProvider.youtubeCaptions ||
    LyricsProvider.musixmatch ||
    LyricsProvider.lastwave => true,
    _ => false,
  };

  bool get isLineSyncProvider => isWordSyncProvider || switch (this) {
    LyricsProvider.lrclib ||
    LyricsProvider.megalobiz => true,
    _ => false,
  };
}

/// Bini identification hit (for ISRC-based lyrics lookup)
@freezed
abstract class BiniHit with _$BiniHit {
  const factory BiniHit({
    String? isrc,
    String? videoId,
    String? spotifyId,
  }) = _BiniHit;

  factory BiniHit.fromJson(Map<String, dynamic> json) =>
      _$BiniHitFromJson(json);
}

/// LRC parsing utilities
class LrcParser {
  static final _timestampRegex = RegExp(r'\[(\d{1,2}):(\d{2})(?:[.:](\d{2,3}))?\]');
  static final _wordStampRegex = RegExp(r'<(\d{1,3}):(\d{2})[.:](\d{2,3})>');
  static final _offsetRegex = RegExp(r'\[offset:\s*([+-]?\d+)\s*\]', caseSensitive: false);

  // Terminal punctuation that indicates a line doesn't continue
  static const terminalPunct = {'.', '?', '!', '…', '。', '？', '！', '।', '॥', '؛', '؟', '。'};
  static const continuationGapWordMs = 1000;
  static const continuationGapLineMs = 400;
  static const continuationMaxSpanMs = 8000;
  static const continuationMaxChars = 140;

  /// Duration plausibility check for same-title wrong-artist detection
  static bool plausibleDuration(List<LyricLine> lines, int? durationSeconds) {
    if (durationSeconds == null || durationSeconds <= 0) return true;
    if (lines.length < 3) return true;
    final expectedMs = durationSeconds * 1000;
    if (expectedMs < 60000) return true;

    final endMs = lines.map((l) => (l.timeMs + l.durationMs)).reduce((a, b) => a > b ? a : b);
    if (endMs <= 0) return true;
    if (endMs > expectedMs + 45000) return false;
    if (endMs < expectedMs * 0.5 && expectedMs - endMs > 90000) return false;
    return true;
  }

  /// Edge-to-edge timing normalization: overlapping rows are fixed
  static List<LyricLine> normalizeLyricTiming(List<LyricLine> lines) {
    if (lines.isEmpty) return lines;
    final sorted = [...lines]..sort((a, b) => a.timeMs.compareTo(b.timeMs));

    // Exact duplicates collapse
    final deduped = <LyricLine>[];
    for (final line in sorted) {
      final prev = deduped.lastOrNull;
      if (prev != null &&
          prev.timeMs == line.timeMs &&
          prev.text.trim() == line.text.trim() &&
          prev.syllables.length == line.syllables.length) {
        continue;
      }
      deduped.add(line);
    }

    return deduped.asMap().map((index, line) {
      final nextStart = deduped.asMap().containsKey(index + 1)
          ? deduped[index + 1].timeMs
          : null;
      var duration = line.durationMs;
      if (duration > 0 && nextStart != null &&
          nextStart > line.timeMs && line.timeMs + duration > nextStart) {
        duration = nextStart - line.timeMs;
      }

      final lineEnd = duration > 0
          ? line.timeMs + duration
          : (line.syllables.map((s) => s.timeMs + s.durationMs).reduce((a, b) => a > b ? a : b)
              .compareTo(line.transliterationSyllables.map((s) => s.timeMs + s.durationMs).reduce((a, b) => a > b ? a : b)) > 0
              ? line.syllables.map((s) => s.timeMs + s.durationMs).reduce((a, b) => a > b ? a : b)
              : line.transliterationSyllables.map((s) => s.timeMs + s.durationMs).reduce((a, b) => a > b ? a : b))
          .toDouble()
          .toInt();

      final syllables = _clampSyllables(line.syllables, lineEnd, duration);
      final translit = _clampSyllables(line.transliterationSyllables, lineEnd, duration);

      if (duration != line.durationMs || syllables != line.syllables || translit != line.transliterationSyllables) {
        return LyricLine(
          timeMs: line.timeMs,
          durationMs: duration,
          text: line.text,
          syllables: syllables,
          transliteration: line.transliteration,
          transliterationSyllables: translit,
        );
      }
      return line;
    }).toList();
  }

  static List<LyricSyllable> _clampSyllables(List<LyricSyllable> units, int lineEnd, int duration) {
    if (units.length < 2) {
      if (units.isEmpty) return units;
      final first = units.first;
      if (first.timeMs + first.durationMs <= lineEnd) return units;
    }

    final ordered = [...units]..sort((a, b) => a.timeMs.compareTo(b.timeMs));
    return ordered.asMap().map((index, syl) {
      final nextStart = ordered.asMap().containsKey(index + 1) ? ordered[index + 1].timeMs : null;
      var end = syl.timeMs + syl.durationMs;
      if (nextStart != null && nextStart > syl.timeMs && end > nextStart) {
        end = nextStart;
      }
      if (lineEnd > syl.timeMs && end > lineEnd) end = lineEnd;
      if (end < syl.timeMs) end = syl.timeMs;
      if (end - syl.timeMs != syl.durationMs) {
        return LyricSyllable(
          timeMs: syl.timeMs,
          durationMs: end - syl.timeMs,
          text: syl.text,
          isBackground: syl.isBackground,
          appendToPrevious: syl.appendToPrevious,
        );
      }
      return syl;
    }).toList();
  }

  /// Merge continuation lines (rows that pick up where previous left off)
  static List<LyricLine> mergeContinuationLines(List<LyricLine> lines) {
    if (lines.length < 2) return lines;
    final out = <LyricLine>[];
    LyricLine? cur;

    void flush() {
      if (cur != null) out.add(cur!);
      cur = null;
    }

    for (final line in lines) {
      final c = cur;
      if (c == null) {
        cur = line;
        continue;
      }

      final cEnd = c.timeMs + c.durationMs;
      final nEnd = line.timeMs + line.durationMs;
      final gap = line.timeMs - cEnd;
      final bothWordSync = c.hasSyllables && line.hasSyllables;
      final gapCap = bothWordSync ? continuationGapWordMs : continuationGapLineMs;

      final canMerge =
          !c.isBackgroundLine() && !line.isBackgroundLine() &&
          c.text.isNotEmpty && line.text.isNotEmpty &&
          c.text.trim() != '♪' && line.text.trim() != '♪' &&
          gap >= 0 && gap <= gapCap &&
          !terminalPunct.contains(c.text.trim().last) &&
          (nEnd - c.timeMs) <= continuationMaxSpanMs &&
          (c.text.length + 1 + line.text.length) <= continuationMaxChars;

      if (!canMerge) {
        flush();
        cur = line;
        continue;
      }

      final mergedSyllables = [...c.syllables, ...line.syllables]..sort((a, b) => a.timeMs.compareTo(b.timeMs));
      final mergedTranslit = [...c.transliterationSyllables, ...line.transliterationSyllables]..sort((a, b) => a.timeMs.compareTo(b.timeMs));

      final translitParts = [
        if (c.transliteration?.isNotEmpty ?? false) c.transliteration!,
        if (line.transliteration?.isNotEmpty ?? false) line.transliteration!,
      ];

      cur = LyricLine(
        timeMs: c.timeMs,
        durationMs: (nEnd > cEnd ? nEnd : cEnd).compareTo(0).isNegative ? 0 : (nEnd > cEnd ? nEnd : cEnd) - c.timeMs,
        text: '${c.text.trimRight()} ${line.text.trimLeft()}',
        syllables: mergedSyllables,
        transliteration: translitParts.join(' ').isNotEmpty ? translitParts.join(' ') : null,
        transliterationSyllables: mergedTranslit,
      );
    }
    flush();
    return out;
  }

  /// Parse LRC content into lyric lines
  static List<LyricLine> parseLrc(String lrcContent) {
    final raws = <_RawLrc>[];
    var offsetMs = 0;

    for (final line in lrcContent.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) continue;

      final offsetMatch = _offsetRegex.firstMatch(trimmed);
      if (offsetMatch != null) {
        offsetMs = int.tryParse(offsetMatch.group(1) ?? '0') ?? 0;
        continue;
      }

      final matches = _timestampRegex.getAllMatches(trimmed).toList();
      if (matches.isEmpty) continue;

      final body = trimmed.replaceAll(_timestampRegex, '');

      for (final match in matches) {
        final minutes = int.tryParse(match.group(1) ?? '0') ?? 0;
        final seconds = int.tryParse(match.group(2) ?? '0') ?? 0;
        final fractionStr = match.group(3) ?? '';
        final ms = _stampToMs(minutes, seconds, fractionStr) + offsetMs;
        raws.add(_RawLrc(timeMs: ms < 0 ? 0 : ms, body: body));
      }
    }

    raws.sort((a, b) => a.timeMs.compareTo(b.timeMs));

    final result = <LyricLine>[];

    for (var index = 0; index < raws.length; index++) {
      final raw = raws[index];
      final nextStart = index + 1 < raws.length ? raws[index + 1].timeMs : null;
      final cleanText = _decodeEntities(raw.body.replaceAll(_wordStampRegex, '').trim());
      final words = _parseWordRuns(raw.body, raw.timeMs, nextStart);

      final isBg = LyricLine.isBackgroundVocalText(cleanText);
      final displayText = isBg ? LyricLine.stripBackgroundParens(cleanText) : cleanText;

      if (words.isNotEmpty) {
        final lineStart = (raw.timeMs < words.first.timeMs ? raw.timeMs : words.first.timeMs);
        final joined = words.map((w) => w.text).join(' ');
        final text = !isBg && displayText.isNotEmpty && displayText.length >= joined.length
            ? displayText
            : isBg ? (displayText.isEmpty ? joined : displayText) : joined;
        final duration = ((nextStart ?? words.map((w) => w.timeMs + w.durationMs).reduce((a, b) => a > b ? a : b)) - lineStart);

        result.add(LyricLine(
          timeMs: lineStart,
          durationMs: duration < 0 ? 0 : duration,
          text: text,
          syllables: isBg ? words.map((w) => w.copyWith(isBackground: true)).toList() : words,
        ));
      } else {
        final lineDuration = nextStart != null && nextStart > raw.timeMs ? nextStart - raw.timeMs : 0;
        final syllables = isBg && displayText.isNotEmpty
            ? [LyricSyllable(
                timeMs: raw.timeMs,
                durationMs: lineDuration > 0 ? lineDuration : 4000,
                text: displayText,
                isBackground: true,
              )]
            : [];
        result.add(LyricLine(
          timeMs: raw.timeMs,
          durationMs: lineDuration,
          text: displayText,
          syllables: syllables,
        ));
      }
    }

    result.sort((a, b) => a.timeMs.compareTo(b.timeMs));
    return result;
  }

  /// Parse enhanced LRC (with word-level timestamps)
  static List<LyricLine> parseEnhancedLrc(String lrcContent) {
    final parsed = parseLrc(lrcContent);
    return parsed.any((l) => l.hasSyllables) ? parsed : [];
  }

  static int _stampToMs(int minutes, int seconds, String? fractionStr) {
    final fractionMs = switch (fractionStr?.length) {
      2 => (int.tryParse(fractionStr!) ?? 0),
      3 => (int.tryParse(fractionStr!) ?? 0),
      1 => (int.tryParse(fractionStr!) ?? 0) * 100,
      _ => 0,
    };
    return (minutes * 60 * 1000) + (seconds * 1000) + fractionMs;
  }

  static List<LyricSyllable> _parseWordRuns(String body, int lineStartMs, int? lineEndMs) {
    final marks = _wordStampRegex.getAllMatches(body).toList();
    if (marks.isEmpty) return [];

    final runs = <_Run>[];
    for (var index = 0; index < marks.length; index++) {
      final until = index + 1 < marks.length ? marks[index + 1].start : body.length;
      final ms = _stampToMs(
        int.tryParse(marks[index].group(1) ?? '0') ?? 0,
        int.tryParse(marks[index].group(2) ?? '0') ?? 0,
        marks[index].group(3),
      );
      runs.add(_Run(startMs: ms, text: body.substring(marks[index].end, until)));
    }

    final words = <LyricSyllable>[];
    for (var index = 0; index < runs.length; index++) {
      final run = runs[index];
      final text = _decodeEntities(run.text).trim();
      if (text.isEmpty) continue;
      final endMs = index + 1 < runs.length
          ? runs[index + 1].startMs
          : (lineEndMs ?? (run.startMs + 800));
      words.add(LyricSyllable(
        timeMs: run.startMs < 0 ? 0 : run.startMs,
        durationMs: endMs - run.startMs < 0 ? 0 : endMs - run.startMs,
        text: text,
      ));
    }
    return words;
  }

  static String _decodeEntities(String raw) {
    if (!raw.contains('&')) return raw;
    var out = raw;
    out = out.replaceAllMapped(RegExp(r'&#x([0-9a-fA-F]+);'), (m) {
      final parsed = int.tryParse(m.group(1) ?? '', radix: 16);
      return parsed != null ? String.fromCharCode(parsed) : m.group(0) ?? '';
    });
    out = out.replaceAllMapped(RegExp(r'&#(\d+);'), (m) {
      final parsed = int.tryParse(m.group(1) ?? '');
      return parsed != null ? String.fromCharCode(parsed) : m.group(0) ?? '';
    });
    out = out
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'")
        .replaceAll('&#39;', "'")
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&amp;', '&');
    return out;
  }
}

class _RawLrc {
  final int timeMs;
  final String body;
  _RawLrc({required this.timeMs, required this.body});
}

class _Run {
  final int startMs;
  final String text;
  _Run({required this.startMs, required this.text});
}

abstract class _Directionality {
  static const leftToRight = 0;
  static const rightToLeft = 1;
  static const rightToLeftArabic = 2;
}