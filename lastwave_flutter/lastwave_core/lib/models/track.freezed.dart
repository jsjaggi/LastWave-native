// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Track {

 String get id; String get name; String get artist; String get album; Duration get duration; String? get coverArtUrl; int get trackNumber; int get discNumber; bool get isLoved; DateTime? get lastScrobbled; int get playCount; String? get url; String? get lastFmUrl; int? get bitrate;
/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackCopyWith<Track> get copyWith => _$TrackCopyWithImpl<Track>(this as Track, _$identity);

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Track;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Track&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.artist, _this.artist) || other.artist == _this.artist)&&(identical(other.album, _this.album) || other.album == _this.album)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.coverArtUrl, _this.coverArtUrl) || other.coverArtUrl == _this.coverArtUrl)&&(identical(other.trackNumber, _this.trackNumber) || other.trackNumber == _this.trackNumber)&&(identical(other.discNumber, _this.discNumber) || other.discNumber == _this.discNumber)&&(identical(other.isLoved, _this.isLoved) || other.isLoved == _this.isLoved)&&(identical(other.lastScrobbled, _this.lastScrobbled) || other.lastScrobbled == _this.lastScrobbled)&&(identical(other.playCount, _this.playCount) || other.playCount == _this.playCount)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.lastFmUrl, _this.lastFmUrl) || other.lastFmUrl == _this.lastFmUrl)&&(identical(other.bitrate, _this.bitrate) || other.bitrate == _this.bitrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Track;
  return Object.hash(runtimeType,_this.id,_this.name,_this.artist,_this.album,_this.duration,_this.coverArtUrl,_this.trackNumber,_this.discNumber,_this.isLoved,_this.lastScrobbled,_this.playCount,_this.url,_this.lastFmUrl,_this.bitrate);
}

@override
String toString() {
  final _this = this as Track;
  return 'Track(id: ${_this.id}, name: ${_this.name}, artist: ${_this.artist}, album: ${_this.album}, duration: ${_this.duration}, coverArtUrl: ${_this.coverArtUrl}, trackNumber: ${_this.trackNumber}, discNumber: ${_this.discNumber}, isLoved: ${_this.isLoved}, lastScrobbled: ${_this.lastScrobbled}, playCount: ${_this.playCount}, url: ${_this.url}, lastFmUrl: ${_this.lastFmUrl}, bitrate: ${_this.bitrate})';
}


}

/// @nodoc
abstract mixin class $TrackCopyWith<$Res>  {
  factory $TrackCopyWith(Track value, $Res Function(Track) _then) = _$TrackCopyWithImpl;
@useResult
$Res call({
 String id, String name, String artist, String album, Duration duration, String? coverArtUrl, int trackNumber, int discNumber, bool isLoved, DateTime? lastScrobbled, int playCount, String? url, String? lastFmUrl, int? bitrate
});




}
/// @nodoc
class _$TrackCopyWithImpl<$Res>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._self, this._then);

  final Track _self;
  final $Res Function(Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? artist = null,Object? album = null,Object? duration = null,Object? coverArtUrl = freezed,Object? trackNumber = null,Object? discNumber = null,Object? isLoved = null,Object? lastScrobbled = freezed,Object? playCount = null,Object? url = freezed,Object? lastFmUrl = freezed,Object? bitrate = freezed,}) {
  return _then(Track(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,coverArtUrl: freezed == coverArtUrl ? _self.coverArtUrl : coverArtUrl // ignore: cast_nullable_to_non_nullable
as String?,trackNumber: null == trackNumber ? _self.trackNumber : trackNumber // ignore: cast_nullable_to_non_nullable
as int,discNumber: null == discNumber ? _self.discNumber : discNumber // ignore: cast_nullable_to_non_nullable
as int,isLoved: null == isLoved ? _self.isLoved : isLoved // ignore: cast_nullable_to_non_nullable
as bool,lastScrobbled: freezed == lastScrobbled ? _self.lastScrobbled : lastScrobbled // ignore: cast_nullable_to_non_nullable
as DateTime?,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,lastFmUrl: freezed == lastFmUrl ? _self.lastFmUrl : lastFmUrl // ignore: cast_nullable_to_non_nullable
as String?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Track].
extension TrackPatterns on Track {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Track value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Track value)  $default,){
final _that = this;
switch (_that) {
case _Track():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Track value)?  $default,){
final _that = this;
switch (_that) {
case _Track() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String artist,  String album,  Duration duration,  String? coverArtUrl,  int trackNumber,  int discNumber,  bool isLoved,  DateTime? lastScrobbled,  int playCount,  String? url,  String? lastFmUrl,  int? bitrate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.name,_that.artist,_that.album,_that.duration,_that.coverArtUrl,_that.trackNumber,_that.discNumber,_that.isLoved,_that.lastScrobbled,_that.playCount,_that.url,_that.lastFmUrl,_that.bitrate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String artist,  String album,  Duration duration,  String? coverArtUrl,  int trackNumber,  int discNumber,  bool isLoved,  DateTime? lastScrobbled,  int playCount,  String? url,  String? lastFmUrl,  int? bitrate)  $default,) {final _that = this;
switch (_that) {
case _Track():
return $default(_that.id,_that.name,_that.artist,_that.album,_that.duration,_that.coverArtUrl,_that.trackNumber,_that.discNumber,_that.isLoved,_that.lastScrobbled,_that.playCount,_that.url,_that.lastFmUrl,_that.bitrate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String artist,  String album,  Duration duration,  String? coverArtUrl,  int trackNumber,  int discNumber,  bool isLoved,  DateTime? lastScrobbled,  int playCount,  String? url,  String? lastFmUrl,  int? bitrate)?  $default,) {final _that = this;
switch (_that) {
case _Track() when $default != null:
return $default(_that.id,_that.name,_that.artist,_that.album,_that.duration,_that.coverArtUrl,_that.trackNumber,_that.discNumber,_that.isLoved,_that.lastScrobbled,_that.playCount,_that.url,_that.lastFmUrl,_that.bitrate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Track implements Track {
  const _Track({required this.id, required this.name, required this.artist, required this.album, required this.duration, required this.coverArtUrl, required this.trackNumber, required this.discNumber, required this.isLoved, required this.lastScrobbled, required this.playCount, required this.url, required this.lastFmUrl, required this.bitrate});
  factory _Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

@override final  String id;
@override final  String name;
@override final  String artist;
@override final  String album;
@override final  Duration duration;
@override final  String? coverArtUrl;
@override final  int trackNumber;
@override final  int discNumber;
@override final  bool isLoved;
@override final  DateTime? lastScrobbled;
@override final  int playCount;
@override final  String? url;
@override final  String? lastFmUrl;
@override final  int? bitrate;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackCopyWith<_Track> get copyWith => __$TrackCopyWithImpl<_Track>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Track&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.coverArtUrl, coverArtUrl) || other.coverArtUrl == coverArtUrl)&&(identical(other.trackNumber, trackNumber) || other.trackNumber == trackNumber)&&(identical(other.discNumber, discNumber) || other.discNumber == discNumber)&&(identical(other.isLoved, isLoved) || other.isLoved == isLoved)&&(identical(other.lastScrobbled, lastScrobbled) || other.lastScrobbled == lastScrobbled)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.url, url) || other.url == url)&&(identical(other.lastFmUrl, lastFmUrl) || other.lastFmUrl == lastFmUrl)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,artist,album,duration,coverArtUrl,trackNumber,discNumber,isLoved,lastScrobbled,playCount,url,lastFmUrl,bitrate);
}

@override
String toString() {
    return 'Track(id: $id, name: $name, artist: $artist, album: $album, duration: $duration, coverArtUrl: $coverArtUrl, trackNumber: $trackNumber, discNumber: $discNumber, isLoved: $isLoved, lastScrobbled: $lastScrobbled, playCount: $playCount, url: $url, lastFmUrl: $lastFmUrl, bitrate: $bitrate)';
}


}

/// @nodoc
abstract mixin class _$TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$TrackCopyWith(_Track value, $Res Function(_Track) _then) = __$TrackCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String artist, String album, Duration duration, String? coverArtUrl, int trackNumber, int discNumber, bool isLoved, DateTime? lastScrobbled, int playCount, String? url, String? lastFmUrl, int? bitrate
});




}
/// @nodoc
class __$TrackCopyWithImpl<$Res>
    implements _$TrackCopyWith<$Res> {
  __$TrackCopyWithImpl(this._self, this._then);

  final _Track _self;
  final $Res Function(_Track) _then;

/// Create a copy of Track
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? artist = null,Object? album = null,Object? duration = null,Object? coverArtUrl = freezed,Object? trackNumber = null,Object? discNumber = null,Object? isLoved = null,Object? lastScrobbled = freezed,Object? playCount = null,Object? url = freezed,Object? lastFmUrl = freezed,Object? bitrate = freezed,}) {
  return _then(_Track(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,coverArtUrl: freezed == coverArtUrl ? _self.coverArtUrl : coverArtUrl // ignore: cast_nullable_to_non_nullable
as String?,trackNumber: null == trackNumber ? _self.trackNumber : trackNumber // ignore: cast_nullable_to_non_nullable
as int,discNumber: null == discNumber ? _self.discNumber : discNumber // ignore: cast_nullable_to_non_nullable
as int,isLoved: null == isLoved ? _self.isLoved : isLoved // ignore: cast_nullable_to_non_nullable
as bool,lastScrobbled: freezed == lastScrobbled ? _self.lastScrobbled : lastScrobbled // ignore: cast_nullable_to_non_nullable
as DateTime?,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,lastFmUrl: freezed == lastFmUrl ? _self.lastFmUrl : lastFmUrl // ignore: cast_nullable_to_non_nullable
as String?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Scrobble {

 String get trackId; String get artistName; String get albumName; String get trackName; DateTime get timestamp; String? get status;
/// Create a copy of Scrobble
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrobbleCopyWith<Scrobble> get copyWith => _$ScrobbleCopyWithImpl<Scrobble>(this as Scrobble, _$identity);

  /// Serializes this Scrobble to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Scrobble;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scrobble&&(identical(other.trackId, _this.trackId) || other.trackId == _this.trackId)&&(identical(other.artistName, _this.artistName) || other.artistName == _this.artistName)&&(identical(other.albumName, _this.albumName) || other.albumName == _this.albumName)&&(identical(other.trackName, _this.trackName) || other.trackName == _this.trackName)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Scrobble;
  return Object.hash(runtimeType,_this.trackId,_this.artistName,_this.albumName,_this.trackName,_this.timestamp,_this.status);
}

@override
String toString() {
  final _this = this as Scrobble;
  return 'Scrobble(trackId: ${_this.trackId}, artistName: ${_this.artistName}, albumName: ${_this.albumName}, trackName: ${_this.trackName}, timestamp: ${_this.timestamp}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $ScrobbleCopyWith<$Res>  {
  factory $ScrobbleCopyWith(Scrobble value, $Res Function(Scrobble) _then) = _$ScrobbleCopyWithImpl;
@useResult
$Res call({
 String trackId, String artistName, String albumName, String trackName, DateTime timestamp, String? status
});




}
/// @nodoc
class _$ScrobbleCopyWithImpl<$Res>
    implements $ScrobbleCopyWith<$Res> {
  _$ScrobbleCopyWithImpl(this._self, this._then);

  final Scrobble _self;
  final $Res Function(Scrobble) _then;

/// Create a copy of Scrobble
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackId = null,Object? artistName = null,Object? albumName = null,Object? trackName = null,Object? timestamp = null,Object? status = freezed,}) {
  return _then(Scrobble(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Scrobble].
extension ScrobblePatterns on Scrobble {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scrobble value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scrobble() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scrobble value)  $default,){
final _that = this;
switch (_that) {
case _Scrobble():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scrobble value)?  $default,){
final _that = this;
switch (_that) {
case _Scrobble() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trackId,  String artistName,  String albumName,  String trackName,  DateTime timestamp,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scrobble() when $default != null:
return $default(_that.trackId,_that.artistName,_that.albumName,_that.trackName,_that.timestamp,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trackId,  String artistName,  String albumName,  String trackName,  DateTime timestamp,  String? status)  $default,) {final _that = this;
switch (_that) {
case _Scrobble():
return $default(_that.trackId,_that.artistName,_that.albumName,_that.trackName,_that.timestamp,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trackId,  String artistName,  String albumName,  String trackName,  DateTime timestamp,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _Scrobble() when $default != null:
return $default(_that.trackId,_that.artistName,_that.albumName,_that.trackName,_that.timestamp,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Scrobble implements Scrobble {
  const _Scrobble({required this.trackId, required this.artistName, required this.albumName, required this.trackName, required this.timestamp, required this.status});
  factory _Scrobble.fromJson(Map<String, dynamic> json) => _$ScrobbleFromJson(json);

@override final  String trackId;
@override final  String artistName;
@override final  String albumName;
@override final  String trackName;
@override final  DateTime timestamp;
@override final  String? status;

/// Create a copy of Scrobble
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrobbleCopyWith<_Scrobble> get copyWith => __$ScrobbleCopyWithImpl<_Scrobble>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrobbleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scrobble&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.artistName, artistName) || other.artistName == artistName)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,trackId,artistName,albumName,trackName,timestamp,status);
}

@override
String toString() {
    return 'Scrobble(trackId: $trackId, artistName: $artistName, albumName: $albumName, trackName: $trackName, timestamp: $timestamp, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ScrobbleCopyWith<$Res> implements $ScrobbleCopyWith<$Res> {
  factory _$ScrobbleCopyWith(_Scrobble value, $Res Function(_Scrobble) _then) = __$ScrobbleCopyWithImpl;
@override @useResult
$Res call({
 String trackId, String artistName, String albumName, String trackName, DateTime timestamp, String? status
});




}
/// @nodoc
class __$ScrobbleCopyWithImpl<$Res>
    implements _$ScrobbleCopyWith<$Res> {
  __$ScrobbleCopyWithImpl(this._self, this._then);

  final _Scrobble _self;
  final $Res Function(_Scrobble) _then;

/// Create a copy of Scrobble
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackId = null,Object? artistName = null,Object? albumName = null,Object? trackName = null,Object? timestamp = null,Object? status = freezed,}) {
  return _then(_Scrobble(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as String,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TasteProfile {

 String get id; Map<String, double> get genreWeights; Map<String, double> get artistWeights; Map<String, double> get albumWeights; List<String> get topGenres; List<String> get topArtists; List<String> get topAlbums;
/// Create a copy of TasteProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasteProfileCopyWith<TasteProfile> get copyWith => _$TasteProfileCopyWithImpl<TasteProfile>(this as TasteProfile, _$identity);

  /// Serializes this TasteProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TasteProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasteProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.genreWeights, _this.genreWeights)&&const DeepCollectionEquality().equals(other.artistWeights, _this.artistWeights)&&const DeepCollectionEquality().equals(other.albumWeights, _this.albumWeights)&&const DeepCollectionEquality().equals(other.topGenres, _this.topGenres)&&const DeepCollectionEquality().equals(other.topArtists, _this.topArtists)&&const DeepCollectionEquality().equals(other.topAlbums, _this.topAlbums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TasteProfile;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.genreWeights),const DeepCollectionEquality().hash(_this.artistWeights),const DeepCollectionEquality().hash(_this.albumWeights),const DeepCollectionEquality().hash(_this.topGenres),const DeepCollectionEquality().hash(_this.topArtists),const DeepCollectionEquality().hash(_this.topAlbums));
}

@override
String toString() {
  final _this = this as TasteProfile;
  return 'TasteProfile(id: ${_this.id}, genreWeights: ${_this.genreWeights}, artistWeights: ${_this.artistWeights}, albumWeights: ${_this.albumWeights}, topGenres: ${_this.topGenres}, topArtists: ${_this.topArtists}, topAlbums: ${_this.topAlbums})';
}


}

/// @nodoc
abstract mixin class $TasteProfileCopyWith<$Res>  {
  factory $TasteProfileCopyWith(TasteProfile value, $Res Function(TasteProfile) _then) = _$TasteProfileCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, double> genreWeights, Map<String, double> artistWeights, Map<String, double> albumWeights, List<String> topGenres, List<String> topArtists, List<String> topAlbums
});




}
/// @nodoc
class _$TasteProfileCopyWithImpl<$Res>
    implements $TasteProfileCopyWith<$Res> {
  _$TasteProfileCopyWithImpl(this._self, this._then);

  final TasteProfile _self;
  final $Res Function(TasteProfile) _then;

/// Create a copy of TasteProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? genreWeights = null,Object? artistWeights = null,Object? albumWeights = null,Object? topGenres = null,Object? topArtists = null,Object? topAlbums = null,}) {
  return _then(TasteProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,genreWeights: null == genreWeights ? _self.genreWeights : genreWeights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,artistWeights: null == artistWeights ? _self.artistWeights : artistWeights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,albumWeights: null == albumWeights ? _self.albumWeights : albumWeights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,topGenres: null == topGenres ? _self.topGenres : topGenres // ignore: cast_nullable_to_non_nullable
as List<String>,topArtists: null == topArtists ? _self.topArtists : topArtists // ignore: cast_nullable_to_non_nullable
as List<String>,topAlbums: null == topAlbums ? _self.topAlbums : topAlbums // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TasteProfile].
extension TasteProfilePatterns on TasteProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasteProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasteProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasteProfile value)  $default,){
final _that = this;
switch (_that) {
case _TasteProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasteProfile value)?  $default,){
final _that = this;
switch (_that) {
case _TasteProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, double> genreWeights,  Map<String, double> artistWeights,  Map<String, double> albumWeights,  List<String> topGenres,  List<String> topArtists,  List<String> topAlbums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasteProfile() when $default != null:
return $default(_that.id,_that.genreWeights,_that.artistWeights,_that.albumWeights,_that.topGenres,_that.topArtists,_that.topAlbums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, double> genreWeights,  Map<String, double> artistWeights,  Map<String, double> albumWeights,  List<String> topGenres,  List<String> topArtists,  List<String> topAlbums)  $default,) {final _that = this;
switch (_that) {
case _TasteProfile():
return $default(_that.id,_that.genreWeights,_that.artistWeights,_that.albumWeights,_that.topGenres,_that.topArtists,_that.topAlbums);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, double> genreWeights,  Map<String, double> artistWeights,  Map<String, double> albumWeights,  List<String> topGenres,  List<String> topArtists,  List<String> topAlbums)?  $default,) {final _that = this;
switch (_that) {
case _TasteProfile() when $default != null:
return $default(_that.id,_that.genreWeights,_that.artistWeights,_that.albumWeights,_that.topGenres,_that.topArtists,_that.topAlbums);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TasteProfile implements TasteProfile {
  const _TasteProfile({required this.id, required  Map<String, double> genreWeights, required  Map<String, double> artistWeights, required  Map<String, double> albumWeights, required  List<String> topGenres, required  List<String> topArtists, required  List<String> topAlbums}): _genreWeights = genreWeights,_artistWeights = artistWeights,_albumWeights = albumWeights,_topGenres = topGenres,_topArtists = topArtists,_topAlbums = topAlbums;
  factory _TasteProfile.fromJson(Map<String, dynamic> json) => _$TasteProfileFromJson(json);

@override final  String id;
 final  Map<String, double> _genreWeights;
@override Map<String, double> get genreWeights {
  if (_genreWeights is EqualUnmodifiableMapView) return _genreWeights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_genreWeights);
}

 final  Map<String, double> _artistWeights;
@override Map<String, double> get artistWeights {
  if (_artistWeights is EqualUnmodifiableMapView) return _artistWeights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_artistWeights);
}

 final  Map<String, double> _albumWeights;
@override Map<String, double> get albumWeights {
  if (_albumWeights is EqualUnmodifiableMapView) return _albumWeights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_albumWeights);
}

 final  List<String> _topGenres;
@override List<String> get topGenres {
  if (_topGenres is EqualUnmodifiableListView) return _topGenres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topGenres);
}

 final  List<String> _topArtists;
@override List<String> get topArtists {
  if (_topArtists is EqualUnmodifiableListView) return _topArtists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topArtists);
}

 final  List<String> _topAlbums;
@override List<String> get topAlbums {
  if (_topAlbums is EqualUnmodifiableListView) return _topAlbums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topAlbums);
}


/// Create a copy of TasteProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasteProfileCopyWith<_TasteProfile> get copyWith => __$TasteProfileCopyWithImpl<_TasteProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasteProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasteProfile&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.genreWeights, _genreWeights)&&const DeepCollectionEquality().equals(other.artistWeights, _artistWeights)&&const DeepCollectionEquality().equals(other.albumWeights, _albumWeights)&&const DeepCollectionEquality().equals(other.topGenres, _topGenres)&&const DeepCollectionEquality().equals(other.topArtists, _topArtists)&&const DeepCollectionEquality().equals(other.topAlbums, _topAlbums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_genreWeights),const DeepCollectionEquality().hash(_artistWeights),const DeepCollectionEquality().hash(_albumWeights),const DeepCollectionEquality().hash(_topGenres),const DeepCollectionEquality().hash(_topArtists),const DeepCollectionEquality().hash(_topAlbums));
}

@override
String toString() {
    return 'TasteProfile(id: $id, genreWeights: $genreWeights, artistWeights: $artistWeights, albumWeights: $albumWeights, topGenres: $topGenres, topArtists: $topArtists, topAlbums: $topAlbums)';
}


}

/// @nodoc
abstract mixin class _$TasteProfileCopyWith<$Res> implements $TasteProfileCopyWith<$Res> {
  factory _$TasteProfileCopyWith(_TasteProfile value, $Res Function(_TasteProfile) _then) = __$TasteProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, double> genreWeights, Map<String, double> artistWeights, Map<String, double> albumWeights, List<String> topGenres, List<String> topArtists, List<String> topAlbums
});




}
/// @nodoc
class __$TasteProfileCopyWithImpl<$Res>
    implements _$TasteProfileCopyWith<$Res> {
  __$TasteProfileCopyWithImpl(this._self, this._then);

  final _TasteProfile _self;
  final $Res Function(_TasteProfile) _then;

/// Create a copy of TasteProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? genreWeights = null,Object? artistWeights = null,Object? albumWeights = null,Object? topGenres = null,Object? topArtists = null,Object? topAlbums = null,}) {
  return _then(_TasteProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,genreWeights: null == genreWeights ? _self._genreWeights : genreWeights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,artistWeights: null == artistWeights ? _self._artistWeights : artistWeights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,albumWeights: null == albumWeights ? _self._albumWeights : albumWeights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,topGenres: null == topGenres ? _self._topGenres : topGenres // ignore: cast_nullable_to_non_nullable
as List<String>,topArtists: null == topArtists ? _self._topArtists : topArtists // ignore: cast_nullable_to_non_nullable
as List<String>,topAlbums: null == topAlbums ? _self._topAlbums : topAlbums // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
