// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Artist {

 String get id; String get name; String? get bio; String? get coverArtUrl; int get followers; int get monthlyListeners; List<String>? get similarArtists;
/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistCopyWith<Artist> get copyWith => _$ArtistCopyWithImpl<Artist>(this as Artist, _$identity);

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Artist;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Artist&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.coverArtUrl, _this.coverArtUrl) || other.coverArtUrl == _this.coverArtUrl)&&(identical(other.followers, _this.followers) || other.followers == _this.followers)&&(identical(other.monthlyListeners, _this.monthlyListeners) || other.monthlyListeners == _this.monthlyListeners)&&const DeepCollectionEquality().equals(other.similarArtists, _this.similarArtists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Artist;
  return Object.hash(runtimeType,_this.id,_this.name,_this.bio,_this.coverArtUrl,_this.followers,_this.monthlyListeners,const DeepCollectionEquality().hash(_this.similarArtists));
}

@override
String toString() {
  final _this = this as Artist;
  return 'Artist(id: ${_this.id}, name: ${_this.name}, bio: ${_this.bio}, coverArtUrl: ${_this.coverArtUrl}, followers: ${_this.followers}, monthlyListeners: ${_this.monthlyListeners}, similarArtists: ${_this.similarArtists})';
}


}

/// @nodoc
abstract mixin class $ArtistCopyWith<$Res>  {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) _then) = _$ArtistCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? bio, String? coverArtUrl, int followers, int monthlyListeners, List<String>? similarArtists
});




}
/// @nodoc
class _$ArtistCopyWithImpl<$Res>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._self, this._then);

  final Artist _self;
  final $Res Function(Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? coverArtUrl = freezed,Object? followers = null,Object? monthlyListeners = null,Object? similarArtists = freezed,}) {
  return _then(Artist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,coverArtUrl: freezed == coverArtUrl ? _self.coverArtUrl : coverArtUrl // ignore: cast_nullable_to_non_nullable
as String?,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,monthlyListeners: null == monthlyListeners ? _self.monthlyListeners : monthlyListeners // ignore: cast_nullable_to_non_nullable
as int,similarArtists: freezed == similarArtists ? _self.similarArtists : similarArtists // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Artist].
extension ArtistPatterns on Artist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Artist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Artist value)  $default,){
final _that = this;
switch (_that) {
case _Artist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Artist value)?  $default,){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? bio,  String? coverArtUrl,  int followers,  int monthlyListeners,  List<String>? similarArtists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.coverArtUrl,_that.followers,_that.monthlyListeners,_that.similarArtists);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? bio,  String? coverArtUrl,  int followers,  int monthlyListeners,  List<String>? similarArtists)  $default,) {final _that = this;
switch (_that) {
case _Artist():
return $default(_that.id,_that.name,_that.bio,_that.coverArtUrl,_that.followers,_that.monthlyListeners,_that.similarArtists);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? bio,  String? coverArtUrl,  int followers,  int monthlyListeners,  List<String>? similarArtists)?  $default,) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.coverArtUrl,_that.followers,_that.monthlyListeners,_that.similarArtists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Artist implements Artist {
  const _Artist({required this.id, required this.name, required this.bio, required this.coverArtUrl, required this.followers, required this.monthlyListeners, required  List<String>? similarArtists}): _similarArtists = similarArtists;
  factory _Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? bio;
@override final  String? coverArtUrl;
@override final  int followers;
@override final  int monthlyListeners;
 final  List<String>? _similarArtists;
@override List<String>? get similarArtists {
  final value = _similarArtists;
  if (value == null) return null;
  if (_similarArtists is EqualUnmodifiableListView) return _similarArtists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistCopyWith<_Artist> get copyWith => __$ArtistCopyWithImpl<_Artist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Artist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.coverArtUrl, coverArtUrl) || other.coverArtUrl == coverArtUrl)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.monthlyListeners, monthlyListeners) || other.monthlyListeners == monthlyListeners)&&const DeepCollectionEquality().equals(other.similarArtists, _similarArtists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,bio,coverArtUrl,followers,monthlyListeners,const DeepCollectionEquality().hash(_similarArtists));
}

@override
String toString() {
    return 'Artist(id: $id, name: $name, bio: $bio, coverArtUrl: $coverArtUrl, followers: $followers, monthlyListeners: $monthlyListeners, similarArtists: $similarArtists)';
}


}

/// @nodoc
abstract mixin class _$ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$ArtistCopyWith(_Artist value, $Res Function(_Artist) _then) = __$ArtistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? bio, String? coverArtUrl, int followers, int monthlyListeners, List<String>? similarArtists
});




}
/// @nodoc
class __$ArtistCopyWithImpl<$Res>
    implements _$ArtistCopyWith<$Res> {
  __$ArtistCopyWithImpl(this._self, this._then);

  final _Artist _self;
  final $Res Function(_Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? coverArtUrl = freezed,Object? followers = null,Object? monthlyListeners = null,Object? similarArtists = freezed,}) {
  return _then(_Artist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,coverArtUrl: freezed == coverArtUrl ? _self.coverArtUrl : coverArtUrl // ignore: cast_nullable_to_non_nullable
as String?,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,monthlyListeners: null == monthlyListeners ? _self.monthlyListeners : monthlyListeners // ignore: cast_nullable_to_non_nullable
as int,similarArtists: freezed == similarArtists ? _self._similarArtists : similarArtists // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
