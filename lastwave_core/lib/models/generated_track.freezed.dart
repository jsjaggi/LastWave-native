// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

@immutable
abstract class _$ImageDto implements ImageDto {
  const _$ImageDto({
    required String url,
    required String size,
  }) : _url = url, _size = size;

  @override
  @JsonKey(name: '#text')
  final String url;

  @override
  final String size;

  @override
  String toString() => 'ImageDto(url: $url, size: $size)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$ImageDto && other.url == url && other.size == size);
  }

  @override
  int get hashCode => Object.hash(url, size);

  @override
  @JsonKey(name: '#text')
  ImageDto copyWith({String? url, String? size}) {
    return _$ImageDto(
      url: url ?? this.url,
      size: size ?? this.size,
    );
  }

  @JsonKey(name: '#text')
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '#text': url,
      'size': size,
    };
  }
}

abstract class _$TrackAttr implements TrackAttr {
  const _$TrackAttr({required String nowplaying}) : _nowplaying = nowplaying;

  @override
  final String nowplaying;

  @override
  String toString() => 'TrackAttr(nowplaying: $nowplaying)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TrackAttr && other.nowplaying == nowplaying);
  }

  @override
  int get hashCode => nowplaying.hashCode;

  @override
  TrackAttr copyWith({String? nowplaying}) {
    return _$TrackAttr(nowplaying: nowplaying ?? this.nowplaying);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'nowplaying': nowplaying};
  }
}

abstract class _$ArtistRef implements ArtistRef {
  const _$ArtistRef({
    required String textName,
    required String name,
    required String mbid,
  })  : _textName = textName,
        _name = name,
        _mbid = mbid;

  @override
  @JsonKey(name: '#text')
  final String textName;

  @override
  final String name;

  @override
  final String mbid;

  @override
  String get displayName => name.isNotEmpty ? name : textName;

  @override
  String toString() => 'ArtistRef(textName: $textName, name: $name, mbid: $mbid)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$ArtistRef && other.textName == textName && other.name == name && other.mbid == mbid);
  }

  @override
  int get hashCode => Object.hash(textName, name, mbid);

  @override
  ArtistRef copyWith({String? textName, String? name, String? mbid}) {
    return _$ArtistRef(
      textName: textName ?? this.textName,
      name: name ?? this.name,
      mbid: mbid ?? this.mbid,
    );
  }

  @JsonKey(name: '#text')
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '#text': textName,
      'name': name,
      'mbid': mbid,
    };
  }
}

abstract class _$DateRef implements DateRef {
  const _$DateRef({
    required String uts,
    required String text,
  })  : _uts = uts, _text = text;

  @override
  final String uts;

  @override
  @JsonKey(name: '#text')
  final String text;

  @override
  String toString() => 'DateRef(uts: $uts, text: $text)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$DateRef && other.uts == uts && other.text == text);
  }

  @override
  int get hashCode => Object.hash(uts, text);

  @override
  DateRef copyWith({String? uts, String? text}) {
    return _$DateRef(uts: uts ?? this.uts, text: text ?? this.text);
  }

  @JsonKey(name: '#text')
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uts': uts,
      '#text': text,
    };
  }
}

abstract class _$RecentTrack implements RecentTrack {
  const _$RecentTrack({
    required String name,
    required ArtistRef artist,
    required ArtistRef album,
    required List<ImageDto> image,
    required String url,
    this.date,
    this.attr,
  })  : _name = name,
        _artist = artist,
        _album = album,
        _image = image,
        _url = url;

  @override
  final String name;

  @override
  final ArtistRef artist;

  @override
  final ArtistRef album;

  @override
  final List<ImageDto> image;

  @override
  final String url;

  @override
  final DateRef? date;

  @override
  @JsonKey(name: '@attr')
  final TrackAttr? attr;

  @override
  bool get isNowPlaying => attr?.nowplaying == 'true';

  @override
  String? get artworkUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => const ImageDto(url: '', size: ''),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => const ImageDto(url: '', size: ''),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  @override
  String toString() => 'RecentTrack(name: $name, artist: $artist, album: $album, image: $image, url: $url, date: $date, attr: $attr)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$RecentTrack &&
            other.name == name &&
            other.artist == artist &&
            other.album == album &&
            const ListEquality().equals(other.image, image) &&
            other.url == url &&
            other.date == date &&
            other.attr == attr);
  }

  @override
  int get hashCode => Object.hash(name, artist, album, image, url, date, attr);

  @override
  RecentTrack copyWith({
    String? name,
    ArtistRef? artist,
    ArtistRef? album,
    List<ImageDto>? image,
    String? url,
    DateRef? date,
    TrackAttr? attr,
  }) {
    return _$RecentTrack(
      name: name ?? this.name,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      image: image ?? this.image,
      url: url ?? this.url,
      date: date ?? this.date,
      attr: attr ?? this.attr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'artist': artist,
      'album': album,
      'image': image,
      'url': url,
      'date': date,
      '@attr': attr,
    };
  }
}

abstract class _$RecentTracksList implements RecentTracksList {
  const _$RecentTracksList({required List<RecentTrack> tracks}) : _tracks = tracks;

  @override
  final List<RecentTrack> tracks;

  @override
  String toString() => 'RecentTracksList(tracks: $tracks)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$RecentTracksList && const ListEquality().equals(other.tracks, tracks));
  }

  @override
  int get hashCode => tracks.hashCode;

  @override
  RecentTracksList copyWith({List<RecentTrack>? tracks}) {
    return _$RecentTracksList(tracks: tracks ?? this.tracks);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'track': tracks};
  }
}

abstract class _$RecentTracksAttr implements RecentTracksAttr {
  const _$RecentTracksAttr({
    required String total,
    required String page,
    required String totalPages,
  })  : _total = total, _page = page, _totalPages = totalPages;

  @override
  final String total;

  @override
  final String page;

  @override
  final String totalPages;

  @override
  String toString() => 'RecentTracksAttr(total: $total, page: $page, totalPages: $totalPages)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$RecentTracksAttr && other.total == total && other.page == page && other.totalPages == totalPages);
  }

  @override
  int get hashCode => Object.hash(total, page, totalPages);

  @override
  RecentTracksAttr copyWith({String? total, String? page, String? totalPages}) {
    return _$RecentTracksAttr(total: total ?? this.total, page: page ?? this.page, totalPages: totalPages ?? this.totalPages);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'total': total,
      'page': page,
      'totalPages': totalPages,
    };
  }
}

abstract class _$RecentTracksBody implements RecentTracksBody {
  const _$RecentTracksBody({
    required RecentTracksList track,
    required RecentTracksAttr attr,
  })  : _track = track, _attr = attr;

  @override
  final RecentTracksList track;

  @override
  @JsonKey(name: '@attr')
  final RecentTracksAttr attr;

  @override
  String toString() => 'RecentTracksBody(track: $track, attr: $attr)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$RecentTracksBody && other.track == track && other.attr == attr);
  }

  @override
  int get hashCode => Object.hash(track, attr);

  @override
  RecentTracksBody copyWith({RecentTracksList? track, RecentTracksAttr? attr}) {
    return _$RecentTracksBody(track: track ?? this.track, attr: attr ?? this.attr);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'track': track,
      '@attr': attr,
    };
  }
}

abstract class _$RecentTracksEnvelope implements RecentTracksEnvelope {
  const _$RecentTracksEnvelope({this.recenttracks, this.error, this.message});

  @override
  final RecentTracksBody? recenttracks;

  @override
  final int? error;

  @override
  final String? message;

  @override
  bool get hasError => error != null;

  @override
  String get errorMessage => message ?? 'Unknown error';

  @override
  String toString() => 'RecentTracksEnvelope(recenttracks: $recenttracks, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$RecentTracksEnvelope && other.recenttracks == recenttracks && other.error == error && other.message == message);
  }

  @override
  int get hashCode => Object.hash(recenttracks, error, message);

  @override
  RecentTracksEnvelope copyWith({RecentTracksBody? recenttracks, int? error, String? message}) {
    return _$RecentTracksEnvelope(recenttracks: recenttracks ?? this.recenttracks, error: error ?? this.error, message: message ?? this.message);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'recenttracks': recenttracks,
      'error': error,
      'message': message,
    };
  }
}

abstract class _$TopTrackEntry implements TopTrackEntry {
  const _$TopTrackEntry({
    required String name,
    required ArtistRef artist,
    required List<ImageDto> image,
    required String url,
    required String playcount,
  })  : _name = name, _artist = artist, _image = image, _url = url, _playcount = playcount;

  @override
  final String name;

  @override
  final ArtistRef artist;

  @override
  final List<ImageDto> image;

  @override
  final String url;

  @override
  final String playcount;

  @override
  int get playCount => int.tryParse(playcount) ?? 0;

  @override
  String? get artworkUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => const ImageDto(url: '', size: ''),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => const ImageDto(url: '', size: ''),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  @override
  String toString() => 'TopTrackEntry(name: $name, artist: $artist, image: $image, url: $url, playcount: $playcount)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$TopTrackEntry &&
            other.name == name &&
            other.artist == artist &&
            const ListEquality().equals(other.image, image) &&
            other.url == url &&
            other.playcount == playcount);
  }

  @override
  int get hashCode => Object.hash(name, artist, image, url, playcount);

  @override
  TopTrackEntry copyWith({String? name, ArtistRef? artist, List<ImageDto>? image, String? url, String? playcount}) {
    return _$TopTrackEntry(
      name: name ?? this.name,
      artist: artist ?? this.artist,
      image: image ?? this.image,
      url: url ?? this.url,
      playcount: playcount ?? this.playcount,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'artist': artist,
      'image': image,
      'url': url,
      'playcount': playcount,
    };
  }
}

abstract class _$TopTrackList implements TopTrackList {
  const _$TopTrackList({required List<TopTrackEntry> tracks}) : _tracks = tracks;

  @override
  final List<TopTrackEntry> tracks;

  @override
  String toString() => 'TopTrackList(tracks: $tracks)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TopTrackList && const ListEquality().equals(other.tracks, tracks));
  }

  @override
  int get hashCode => tracks.hashCode;

  @override
  TopTrackList copyWith({List<TopTrackEntry>? tracks}) {
    return _$TopTrackList(tracks: tracks ?? this.tracks);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'track': tracks};
  }
}

abstract class _$TopTracksFullBody implements TopTracksFullBody {
  const _$TopTracksFullBody({
    required TopTrackList track,
    required StatTotalAttr attr,
  })  : _track = track, _attr = attr;

  @override
  final TopTrackList track;

  @override
  @JsonKey(name: '@attr')
  final StatTotalAttr attr;

  @override
  String toString() => 'TopTracksFullBody(track: $track, attr: $attr)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TopTracksFullBody && other.track == track && other.attr == attr);
  }

  @override
  int get hashCode => Object.hash(track, attr);

  @override
  TopTracksFullBody copyWith({TopTrackList? track, StatTotalAttr? attr}) {
    return _$TopTracksFullBody(track: track ?? this.track, attr: attr ?? this.attr);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'track': track,
      '@attr': attr,
    };
  }
}

abstract class _$TopTracksFullEnvelope implements TopTracksFullEnvelope {
  const _$TopTracksFullEnvelope({this.toptracks, this.error, this.message});

  @override
  final TopTracksFullBody? toptracks;

  @override
  final int? error;

  @override
  final String? message;

  @override
  String toString() => 'TopTracksFullEnvelope(toptracks: $toptracks, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$TopTracksFullEnvelope && other.toptracks == toptracks && other.error == error && other.message == message);
  }

  @override
  int get hashCode => Object.hash(toptracks, error, message);

  @override
  TopTracksFullEnvelope copyWith({TopTracksFullBody? toptracks, int? error, String? message}) {
    return _$TopTracksFullEnvelope(toptracks: toptracks ?? this.toptracks, error: error ?? this.error, message: message ?? this.message);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'toptracks': toptracks,
      'error': error,
      'message': message,
    };
  }
}

abstract class _$StatTotalAttr implements StatTotalAttr {
  const _$StatTotalAttr({required String total}) : _total = total;

  @override
  final String total;

  @override
  String toString() => 'StatTotalAttr(total: $total)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$StatTotalAttr && other.total == total);
  }

  @override
  int get hashCode => total.hashCode;

  @override
  StatTotalAttr copyWith({String? total}) {
    return _$StatTotalAttr(total: total ?? this.total);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'total': total};
  }
}

abstract class _$UserInfoUser implements UserInfoUser {
  const _$UserInfoUser({
    required String playcount,
    required List<ImageDto> image,
  })  : _playcount = playcount, _image = image;

  @override
  final String playcount;

  @override
  final List<ImageDto> image;

  @override
  String toString() => 'UserInfoUser(playcount: $playcount, image: $image)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$UserInfoUser && other.playcount == playcount && const ListEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(playcount, image);

  @override
  UserInfoUser copyWith({String? playcount, List<ImageDto>? image}) {
    return _$UserInfoUser(playcount: playcount ?? this.playcount, image: image ?? this.image);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'playcount': playcount,
      'image': image,
    };
  }
}

abstract class _$UserInfoEnvelope implements UserInfoEnvelope {
  const _$UserInfoEnvelope({this.user, this.error, this.message});

  @override
  final UserInfoUser? user;

  @override
  final int? error;

  @override
  final String? message;

  @override
  String toString() => 'UserInfoEnvelope(user: $user, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$UserInfoEnvelope && other.user == user && other.error == error && other.message == message);
  }

  @override
  int get hashCode => Object.hash(user, error, message);

  @override
  UserInfoEnvelope copyWith({UserInfoUser? user, int? error, String? message}) {
    return _$UserInfoEnvelope(user: user ?? this.user, error: error ?? this.error, message: message ?? this.message);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user,
      'error': error,
      'message': message,
    };
  }
}

abstract class _$FriendEntry implements FriendEntry {
  const _$FriendEntry({
    required String name,
    required String realname,
    required List<ImageDto> image,
  })  : _name = name, _realname = realname, _image = image;

  @override
  final String name;

  @override
  final String realname;

  @override
  final List<ImageDto> image;

  @override
  String get displayName => realname.isNotEmpty ? realname : name;

  @override
  String? get avatarUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => const ImageDto(url: '', size: ''),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => const ImageDto(url: '', size: ''),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  @override
  String toString() => 'FriendEntry(name: $name, realname: $realname, image: $image)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$FriendEntry && other.name == name && other.realname == realname && const ListEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(name, realname, image);

  @override
  FriendEntry copyWith({String? name, String? realname, List<ImageDto>? image}) {
    return _$FriendEntry(name: name ?? this.name, realname: realname ?? this.realname, image: image ?? this.image);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'realname': realname,
      'image': image,
    };
  }
}

abstract class _$FriendsListDto implements FriendsListDto {
  const _$FriendsListDto({required List<FriendEntry> user}) : _user = user;

  @override
  @JsonKey(name: 'user')
  final List<FriendEntry> user;

  @override
  String toString() => 'FriendsListDto(user: $user)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$FriendsListDto && const ListEquality().equals(other.user, user));
  }

  @override
  int get hashCode => user.hashCode;

  @override
  FriendsListDto copyWith({List<FriendEntry>? user}) {
    return _$FriendsListDto(user: user ?? this.user);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'user': user};
  }
}

abstract class _$FriendsEnvelope implements FriendsEnvelope {
  const _$FriendsEnvelope({this.friends, this.error, this.message});

  @override
  final FriendsListDto? friends;

  @override
  final int? error;

  @override
  final String? message;

  @override
  String toString() => 'FriendsEnvelope(friends: $friends, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$FriendsEnvelope && other.friends == friends && other.error == error && other.message == message);
  }

  @override
  int get hashCode => Object.hash(friends, error, message);

  @override
  FriendsEnvelope copyWith({FriendsListDto? friends, int? error, String? message}) {
    return _$FriendsEnvelope(friends: friends ?? this.friends, error: error ?? this.error, message: message ?? this.message);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'friends': friends,
      'error': error,
      'message': message,
    };
  }
}

abstract class _$TrackInfoAlbum implements TrackInfoAlbum {
  const _$TrackInfoAlbum({required List<ImageDto> image}) : _image = image;

  @override
  final List<ImageDto> image;

  @override
  String toString() => 'TrackInfoAlbum(image: $image)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TrackInfoAlbum && const ListEquality().equals(other.image, image));
  }

  @override
  int get hashCode => image.hashCode;

  @override
  TrackInfoAlbum copyWith({List<ImageDto>? image}) {
    return _$TrackInfoAlbum(image: image ?? this.image);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'image': image};
  }
}

abstract class _$TrackInfoDetail implements TrackInfoDetail {
  const _$TrackInfoDetail({required List<ImageDto> image, this.album})
      : _image = image;

  @override
  final List<ImageDto> image;

  @override
  final TrackInfoAlbum? album;

  @override
  String toString() => 'TrackInfoDetail(image: $image, album: $album)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TrackInfoDetail && const ListEquality().equals(other.image, image) && other.album == album);
  }

  @override
  int get hashCode => Object.hash(image, album);

  @override
  TrackInfoDetail copyWith({List<ImageDto>? image, TrackInfoAlbum? album}) {
    return _$TrackInfoDetail(image: image ?? this.image, album: album ?? this.album);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'image': image,
      'album': album,
    };
  }
}

abstract class _$TrackInfoEnvelope implements TrackInfoEnvelope {
  const _$TrackInfoEnvelope({this.track, this.error, this.message});

  @override
  final TrackInfoDetail? track;

  @override
  final int? error;

  @override
  final String? message.

  @override
  String toString() => 'TrackInfoEnvelope(track: $track, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TrackInfoEnvelope && other.track == track && other.error == error && other.message == message);
  }

  @override
  int get hashCode => Object.hash(track, error, message);

  @override
  TrackInfoEnvelope copyWith({TrackInfoDetail? track, int? error, String? message}) {
    return _$TrackInfoEnvelope(track: track ?? this.track, error: error ?? this.error, message: message ?? this.message);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'track': track,
      'error': error,
      'message': message,
    };
  }
}

abstract class _$TrackKey implements TrackKey {
  const _$TrackKey({required String artist, required String track}) : _artist = artist, _track = track;

  @override
  final String artist;

  @override
  final String track.

  @override
  String toString() => '$artist|$track'.

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is _$TrackKey && other.artist == artist && other.track == track);
  }

  @override
  int get hashCode => Object.hash(artist, track).

  @override
  TrackKey copyWith({String? artist, String? track}) {
    return _$TrackKey(artist: artist ?? this.artist, track: track ?? this.track);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'artist': artist,
      'track': track,
    };
  }
}

abstract class _$GeneratedTrack implements GeneratedTrack {
  const _$GeneratedTrack({
    required String name,
    required String artist,
    this.album,
    this.url,
    required List<ImageDto> image,
    this.listeners,
    this.playcount,
    this.match,
    this.mbid,
    this.key,
    this.videoId,
    this.source,
    this.weight,
    this.tags,
  })  : _name = name,
        _artist = artist,
        _album = album,
        _url = url,
        _image = image,
        _listeners = listeners,
        _playcount = playcount,
        _match = match,
        _mbid = mbid,
        _key = key,
        _videoId = videoId,
        _source = source,
        _weight = weight,
        _tags = tags;

  @override
  final String name;

  @override
  final String artist.

  @override
  final String? album;

  @override
  final String? url.

  @override
  final List<ImageDto> image.

  @override
  final int? listeners.

  @override
  final int? playcount.

  @override
  final int? match.

  @override
  final String? mbid.

  @override
  final String? key.

  @override
  final String? videoId.

  @override
  final String? source.

  @override
  final double? weight.

  @override
  final List<String>? tags.

  @override
  String get trackKey => key ?? TrackKey.create(artist, name).toString().

  @override
  String? get artworkUrl {
    if (image.isEmpty) return null;
    const priority = ['extralarge', 'large', 'medium', 'small'];
    for (final size in priority) {
      final match = image.firstWhere(
        (img) => img.size == size && _isValidArtwork(img.url),
        orElse: () => const ImageDto(url: '', size: ''),
      );
      if (match.url.isNotEmpty) return match.url;
    }
    final fallback = image.firstWhere(
      (img) => _isValidArtwork(img.url),
      orElse: () => const ImageDto(url: '', size: ''),
    );
    return fallback.url.isNotEmpty ? fallback.url : null;
  }

  @override
  String toString() => 'GeneratedTrack(name: $name, artist: $artist, album: $album, url: $url, image: $image, listeners: $listeners, playcount: $playcount, match: $match, mbid: $mbid, key: $key, videoId: $videoId, source: $source, weight: $weight, tags: $tags)'.

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is _$GeneratedTrack &&
            other.name == name &&
            other.artist == artist &&
            other.album == album &&
            other.url == url &&
            const ListEquality().equals(other.image, image) &&
            other.listeners == listeners &&
            other.playcount == playcount &&
            other.match == match &&
            other.mbid == mbid &&
            other.key == key &&
            other.videoId == videoId &&
            other.source == source &&
            other.weight == weight &&
            const ListEquality().equals(other.tags, tags));
  }

  @override
  int get hashCode => Object.hash(name, artist, album, url, image, listeners, playcount, match, mbid, key, videoId, source, weight, tags).

  @override
  GeneratedTrack copyWith({
    String? name,
    String? artist,
    String? album,
    String? url,
    List<ImageDto>? image,
    int? listeners,
    int? playcount,
    int? match,
    String? mbid,
    String? key,
    String? videoId,
    String? source,
    double? weight,
    List<String>? tags,
  }) {
    return _$GeneratedTrack(
      name: name ?? this.name,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      url: url ?? this.url,
      image: image ?? this.image,
      listeners: listeners ?? this.listeners,
      playcount: playcount ?? this.playcount,
      match: match ?? this.match,
      mbid: mbid ?? this.mbid,
      key: key ?? this.key,
      videoId: videoId ?? this.videoId,
      source: source ?? this.source,
      weight: weight ?? this.weight,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'artist': artist,
      'album': album,
      'url': url,
      'image': image,
      'listeners': listeners,
      'playcount': playcount,
      'match': match,
      'mbid': mbid,
      'key': key,
      'videoId': videoId,
      'source': source,
      'weight': weight,
      'tags': tags,
    };
  }
}