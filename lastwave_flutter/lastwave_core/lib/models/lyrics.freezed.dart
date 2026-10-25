// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LyricSyllable {

 String get text; double get offset; double get duration;
/// Create a copy of LyricSyllable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricSyllableCopyWith<LyricSyllable> get copyWith => _$LyricSyllableCopyWithImpl<LyricSyllable>(this as LyricSyllable, _$identity);

  /// Serializes this LyricSyllable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LyricSyllable;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricSyllable&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.offset, _this.offset) || other.offset == _this.offset)&&(identical(other.duration, _this.duration) || other.duration == _this.duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LyricSyllable;
  return Object.hash(runtimeType,_this.text,_this.offset,_this.duration);
}

@override
String toString() {
  final _this = this as LyricSyllable;
  return 'LyricSyllable(text: ${_this.text}, offset: ${_this.offset}, duration: ${_this.duration})';
}


}

/// @nodoc
abstract mixin class $LyricSyllableCopyWith<$Res>  {
  factory $LyricSyllableCopyWith(LyricSyllable value, $Res Function(LyricSyllable) _then) = _$LyricSyllableCopyWithImpl;
@useResult
$Res call({
 String text, double offset, double duration
});




}
/// @nodoc
class _$LyricSyllableCopyWithImpl<$Res>
    implements $LyricSyllableCopyWith<$Res> {
  _$LyricSyllableCopyWithImpl(this._self, this._then);

  final LyricSyllable _self;
  final $Res Function(LyricSyllable) _then;

/// Create a copy of LyricSyllable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? offset = null,Object? duration = null,}) {
  return _then(LyricSyllable(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricSyllable].
extension LyricSyllablePatterns on LyricSyllable {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricSyllable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricSyllable() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricSyllable value)  $default,){
final _that = this;
switch (_that) {
case _LyricSyllable():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricSyllable value)?  $default,){
final _that = this;
switch (_that) {
case _LyricSyllable() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  double offset,  double duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricSyllable() when $default != null:
return $default(_that.text,_that.offset,_that.duration);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  double offset,  double duration)  $default,) {final _that = this;
switch (_that) {
case _LyricSyllable():
return $default(_that.text,_that.offset,_that.duration);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  double offset,  double duration)?  $default,) {final _that = this;
switch (_that) {
case _LyricSyllable() when $default != null:
return $default(_that.text,_that.offset,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricSyllable implements LyricSyllable {
  const _LyricSyllable({required this.text, required this.offset, required this.duration});
  factory _LyricSyllable.fromJson(Map<String, dynamic> json) => _$LyricSyllableFromJson(json);

@override final  String text;
@override final  double offset;
@override final  double duration;

/// Create a copy of LyricSyllable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricSyllableCopyWith<_LyricSyllable> get copyWith => __$LyricSyllableCopyWithImpl<_LyricSyllable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricSyllableToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricSyllable&&(identical(other.text, text) || other.text == text)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text,offset,duration);
}

@override
String toString() {
    return 'LyricSyllable(text: $text, offset: $offset, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$LyricSyllableCopyWith<$Res> implements $LyricSyllableCopyWith<$Res> {
  factory _$LyricSyllableCopyWith(_LyricSyllable value, $Res Function(_LyricSyllable) _then) = __$LyricSyllableCopyWithImpl;
@override @useResult
$Res call({
 String text, double offset, double duration
});




}
/// @nodoc
class __$LyricSyllableCopyWithImpl<$Res>
    implements _$LyricSyllableCopyWith<$Res> {
  __$LyricSyllableCopyWithImpl(this._self, this._then);

  final _LyricSyllable _self;
  final $Res Function(_LyricSyllable) _then;

/// Create a copy of LyricSyllable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? offset = null,Object? duration = null,}) {
  return _then(_LyricSyllable(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$LyricLine {

 String get text; double get offset; double get duration; int get syllableCount;
/// Create a copy of LyricLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricLineCopyWith<LyricLine> get copyWith => _$LyricLineCopyWithImpl<LyricLine>(this as LyricLine, _$identity);

  /// Serializes this LyricLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LyricLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricLine&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.offset, _this.offset) || other.offset == _this.offset)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.syllableCount, _this.syllableCount) || other.syllableCount == _this.syllableCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LyricLine;
  return Object.hash(runtimeType,_this.text,_this.offset,_this.duration,_this.syllableCount);
}

@override
String toString() {
  final _this = this as LyricLine;
  return 'LyricLine(text: ${_this.text}, offset: ${_this.offset}, duration: ${_this.duration}, syllableCount: ${_this.syllableCount})';
}


}

/// @nodoc
abstract mixin class $LyricLineCopyWith<$Res>  {
  factory $LyricLineCopyWith(LyricLine value, $Res Function(LyricLine) _then) = _$LyricLineCopyWithImpl;
@useResult
$Res call({
 String text, double offset, double duration, int syllableCount
});




}
/// @nodoc
class _$LyricLineCopyWithImpl<$Res>
    implements $LyricLineCopyWith<$Res> {
  _$LyricLineCopyWithImpl(this._self, this._then);

  final LyricLine _self;
  final $Res Function(LyricLine) _then;

/// Create a copy of LyricLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? offset = null,Object? duration = null,Object? syllableCount = null,}) {
  return _then(LyricLine(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,syllableCount: null == syllableCount ? _self.syllableCount : syllableCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricLine].
extension LyricLinePatterns on LyricLine {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricLine() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricLine value)  $default,){
final _that = this;
switch (_that) {
case _LyricLine():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricLine value)?  $default,){
final _that = this;
switch (_that) {
case _LyricLine() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  double offset,  double duration,  int syllableCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricLine() when $default != null:
return $default(_that.text,_that.offset,_that.duration,_that.syllableCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  double offset,  double duration,  int syllableCount)  $default,) {final _that = this;
switch (_that) {
case _LyricLine():
return $default(_that.text,_that.offset,_that.duration,_that.syllableCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  double offset,  double duration,  int syllableCount)?  $default,) {final _that = this;
switch (_that) {
case _LyricLine() when $default != null:
return $default(_that.text,_that.offset,_that.duration,_that.syllableCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricLine implements LyricLine {
  const _LyricLine({required this.text, required this.offset, required this.duration, required this.syllableCount});
  factory _LyricLine.fromJson(Map<String, dynamic> json) => _$LyricLineFromJson(json);

@override final  String text;
@override final  double offset;
@override final  double duration;
@override final  int syllableCount;

/// Create a copy of LyricLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricLineCopyWith<_LyricLine> get copyWith => __$LyricLineCopyWithImpl<_LyricLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricLine&&(identical(other.text, text) || other.text == text)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.syllableCount, syllableCount) || other.syllableCount == syllableCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text,offset,duration,syllableCount);
}

@override
String toString() {
    return 'LyricLine(text: $text, offset: $offset, duration: $duration, syllableCount: $syllableCount)';
}


}

/// @nodoc
abstract mixin class _$LyricLineCopyWith<$Res> implements $LyricLineCopyWith<$Res> {
  factory _$LyricLineCopyWith(_LyricLine value, $Res Function(_LyricLine) _then) = __$LyricLineCopyWithImpl;
@override @useResult
$Res call({
 String text, double offset, double duration, int syllableCount
});




}
/// @nodoc
class __$LyricLineCopyWithImpl<$Res>
    implements _$LyricLineCopyWith<$Res> {
  __$LyricLineCopyWithImpl(this._self, this._then);

  final _LyricLine _self;
  final $Res Function(_LyricLine) _then;

/// Create a copy of LyricLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? offset = null,Object? duration = null,Object? syllableCount = null,}) {
  return _then(_LyricLine(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,syllableCount: null == syllableCount ? _self.syllableCount : syllableCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Lyrics {

 String get trackId; String get language; List<LyricLine> get lines;
/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsCopyWith<Lyrics> get copyWith => _$LyricsCopyWithImpl<Lyrics>(this as Lyrics, _$identity);

  /// Serializes this Lyrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Lyrics;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lyrics&&(identical(other.trackId, _this.trackId) || other.trackId == _this.trackId)&&(identical(other.language, _this.language) || other.language == _this.language)&&const DeepCollectionEquality().equals(other.lines, _this.lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Lyrics;
  return Object.hash(runtimeType,_this.trackId,_this.language,const DeepCollectionEquality().hash(_this.lines));
}

@override
String toString() {
  final _this = this as Lyrics;
  return 'Lyrics(trackId: ${_this.trackId}, language: ${_this.language}, lines: ${_this.lines})';
}


}

/// @nodoc
abstract mixin class $LyricsCopyWith<$Res>  {
  factory $LyricsCopyWith(Lyrics value, $Res Function(Lyrics) _then) = _$LyricsCopyWithImpl;
@useResult
$Res call({
 String trackId, String language, List<LyricLine> lines
});




}
/// @nodoc
class _$LyricsCopyWithImpl<$Res>
    implements $LyricsCopyWith<$Res> {
  _$LyricsCopyWithImpl(this._self, this._then);

  final Lyrics _self;
  final $Res Function(Lyrics) _then;

/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackId = null,Object? language = null,Object? lines = null,}) {
  return _then(Lyrics(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<LyricLine>,
  ));
}

}


/// Adds pattern-matching-related methods to [Lyrics].
extension LyricsPatterns on Lyrics {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lyrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lyrics value)  $default,){
final _that = this;
switch (_that) {
case _Lyrics():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lyrics value)?  $default,){
final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trackId,  String language,  List<LyricLine> lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that.trackId,_that.language,_that.lines);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trackId,  String language,  List<LyricLine> lines)  $default,) {final _that = this;
switch (_that) {
case _Lyrics():
return $default(_that.trackId,_that.language,_that.lines);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trackId,  String language,  List<LyricLine> lines)?  $default,) {final _that = this;
switch (_that) {
case _Lyrics() when $default != null:
return $default(_that.trackId,_that.language,_that.lines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lyrics implements Lyrics {
  const _Lyrics({required this.trackId, required this.language, required  List<LyricLine> lines}): _lines = lines;
  factory _Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);

@override final  String trackId;
@override final  String language;
 final  List<LyricLine> _lines;
@override List<LyricLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}


/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsCopyWith<_Lyrics> get copyWith => __$LyricsCopyWithImpl<_Lyrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lyrics&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.lines, _lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,trackId,language,const DeepCollectionEquality().hash(_lines));
}

@override
String toString() {
    return 'Lyrics(trackId: $trackId, language: $language, lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$LyricsCopyWith<$Res> implements $LyricsCopyWith<$Res> {
  factory _$LyricsCopyWith(_Lyrics value, $Res Function(_Lyrics) _then) = __$LyricsCopyWithImpl;
@override @useResult
$Res call({
 String trackId, String language, List<LyricLine> lines
});




}
/// @nodoc
class __$LyricsCopyWithImpl<$Res>
    implements _$LyricsCopyWith<$Res> {
  __$LyricsCopyWithImpl(this._self, this._then);

  final _Lyrics _self;
  final $Res Function(_Lyrics) _then;

/// Create a copy of Lyrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackId = null,Object? language = null,Object? lines = null,}) {
  return _then(_Lyrics(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<LyricLine>,
  ));
}


}

// dart format on
