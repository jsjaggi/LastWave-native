// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Album {

 String get id; String get name; String get artist; String? get coverArtUrl; int get year; int get totalTracks; String? get spotifyId;
/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumCopyWith<Album> get copyWith => _$AlbumCopyWithImpl<Album>(this as Album, _$identity);

  /// Serializes this Album to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Album;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Album&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.artist, _this.artist) || other.artist == _this.artist)&&(identical(other.coverArtUrl, _this.coverArtUrl) || other.coverArtUrl == _this.coverArtUrl)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.totalTracks, _this.totalTracks) || other.totalTracks == _this.totalTracks)&&(identical(other.spotifyId, _this.spotifyId) || other.spotifyId == _this.spotifyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Album;
  return Object.hash(runtimeType,_this.id,_this.name,_this.artist,_this.coverArtUrl,_this.year,_this.totalTracks,_this.spotifyId);
}

@override
String toString() {
  final _this = this as Album;
  return 'Album(id: ${_this.id}, name: ${_this.name}, artist: ${_this.artist}, coverArtUrl: ${_this.coverArtUrl}, year: ${_this.year}, totalTracks: ${_this.totalTracks}, spotifyId: ${_this.spotifyId})';
}


}

/// @nodoc
abstract mixin class $AlbumCopyWith<$Res>  {
  factory $AlbumCopyWith(Album value, $Res Function(Album) _then) = _$AlbumCopyWithImpl;
@useResult
$Res call({
 String id, String name, String artist, String? coverArtUrl, int year, int totalTracks, String? spotifyId
});




}
/// @nodoc
class _$AlbumCopyWithImpl<$Res>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._self, this._then);

  final Album _self;
  final $Res Function(Album) _then;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? artist = null,Object? coverArtUrl = freezed,Object? year = null,Object? totalTracks = null,Object? spotifyId = freezed,}) {
  return _then(Album(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,coverArtUrl: freezed == coverArtUrl ? _self.coverArtUrl : coverArtUrl // ignore: cast_nullable_to_non_nullable
as String?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,totalTracks: null == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int,spotifyId: freezed == spotifyId ? _self.spotifyId : spotifyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Album].
extension AlbumPatterns on Album {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Album value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Album() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Album value)  $default,){
final _that = this;
switch (_that) {
case _Album():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Album value)?  $default,){
final _that = this;
switch (_that) {
case _Album() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String artist,  String? coverArtUrl,  int year,  int totalTracks,  String? spotifyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Album() when $default != null:
return $default(_that.id,_that.name,_that.artist,_that.coverArtUrl,_that.year,_that.totalTracks,_that.spotifyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String artist,  String? coverArtUrl,  int year,  int totalTracks,  String? spotifyId)  $default,) {final _that = this;
switch (_that) {
case _Album():
return $default(_that.id,_that.name,_that.artist,_that.coverArtUrl,_that.year,_that.totalTracks,_that.spotifyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String artist,  String? coverArtUrl,  int year,  int totalTracks,  String? spotifyId)?  $default,) {final _that = this;
switch (_that) {
case _Album() when $default != null:
return $default(_that.id,_that.name,_that.artist,_that.coverArtUrl,_that.year,_that.totalTracks,_that.spotifyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Album implements Album {
  const _Album({required this.id, required this.name, required this.artist, required this.coverArtUrl, required this.year, required this.totalTracks, required this.spotifyId});
  factory _Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

@override final  String id;
@override final  String name;
@override final  String artist;
@override final  String? coverArtUrl;
@override final  int year;
@override final  int totalTracks;
@override final  String? spotifyId;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumCopyWith<_Album> get copyWith => __$AlbumCopyWithImpl<_Album>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Album&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.coverArtUrl, coverArtUrl) || other.coverArtUrl == coverArtUrl)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalTracks, totalTracks) || other.totalTracks == totalTracks)&&(identical(other.spotifyId, spotifyId) || other.spotifyId == spotifyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,artist,coverArtUrl,year,totalTracks,spotifyId);
}

@override
String toString() {
    return 'Album(id: $id, name: $name, artist: $artist, coverArtUrl: $coverArtUrl, year: $year, totalTracks: $totalTracks, spotifyId: $spotifyId)';
}


}

/// @nodoc
abstract mixin class _$AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$AlbumCopyWith(_Album value, $Res Function(_Album) _then) = __$AlbumCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String artist, String? coverArtUrl, int year, int totalTracks, String? spotifyId
});




}
/// @nodoc
class __$AlbumCopyWithImpl<$Res>
    implements _$AlbumCopyWith<$Res> {
  __$AlbumCopyWithImpl(this._self, this._then);

  final _Album _self;
  final $Res Function(_Album) _then;

/// Create a copy of Album
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? artist = null,Object? coverArtUrl = freezed,Object? year = null,Object? totalTracks = null,Object? spotifyId = freezed,}) {
  return _then(_Album(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,coverArtUrl: freezed == coverArtUrl ? _self.coverArtUrl : coverArtUrl // ignore: cast_nullable_to_non_nullable
as String?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,totalTracks: null == totalTracks ? _self.totalTracks : totalTracks // ignore: cast_nullable_to_non_nullable
as int,spotifyId: freezed == spotifyId ? _self.spotifyId : spotifyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
