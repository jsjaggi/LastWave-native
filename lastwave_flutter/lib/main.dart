import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lastwave_core/lastwave_core.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sl = GetIt.instance;

  // Register core services
  sl.registerLazySingleton<CacheService>(() => CacheServiceImpl());
  sl.registerLazySingleton<RateLimiter>(() => RateLimiterImpl());

  // Initialize repositories with API
  final api = LastFmApiServiceImpl(Dio());
  sl.registerLazySingleton<TrackRepository>(() => TrackRepositoryImpl(api, sl(), sl()));
  sl.registerLazySingleton<ArtistRepository>(() => ArtistRepositoryImpl(api));
  sl.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryImpl(api));
  sl.registerLazySingleton<LyricsRepository>(() => LyricsRepositoryImpl(api));
  sl.registerLazySingleton<ScrobbleRepository>(() => ScrobbleRepositoryImpl(api, sl(), sl()));
  sl.registerLazySingleton<RecommendationEngine>(() => RecommendationEngineImpl(
    sl(), sl(), sl()
  ));

  runApp(const LastWaveApp());
}

class LastWaveApp extends StatelessWidget {
  const LastWaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LastWave',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
      locale: const Locale('en', 'US'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  List<Track> _recommendedTracks = [];
  List<Artist> _trendingArtists = [];
  List<Album> _recommendedAlbums = [];

  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  Future<void> _loadHomeData() async {
    final trackRepo = GetIt.instance<TrackRepository>();
    final artistRepo = GetIt.instance<ArtistRepository>();
    final albumRepo = GetIt.instance<AlbumRepository>();

    final tracksResult = await trackRepo.search('recommended');
    tracksResult.fold(
      (l) => _showError('Error loading tracks'),
      (r) => setState(() => _recommendedTracks = r),
    );

    final artistsResult = await artistRepo.search('trending');
    artistsResult.fold(
      (l) => _showError('Error loading artists'),
      (r) => setState(() => _trendingArtists = r),
    );

    final albumsResult = await albumRepo.search('recommended');
    albumsResult.fold(
      (l) => _showError('Error loading albums'),
      (r) => setState(() => _recommendedAlbums = r),
    );

    setState(() => _isLoading = false);
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LastWave'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Recommendations'),
                  _buildTrackGrid(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Trending Artists'),
                  _buildArtistList(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Recommended Albums'),
                  _buildAlbumGrid(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTrackGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: _recommendedTracks.length,
      itemBuilder: (context, index) {
        final track = _recommendedTracks[index];
        return _buildTrackCard(track);
      },
    );
  }

  Widget _buildTrackCard(Track track) {
    return Card(
      color: Colors.deepPurple[900],
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Icon(Icons.music_note, color: Colors.white54, size: 30),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                track.name,
                style: const TextStyle(color: Colors.white, fontSize: 12, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              Text(
                track.artist,
                style: const TextStyle(color: Colors.grey, fontSize: 10, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArtistList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _trendingArtists.length,
      itemBuilder: (context, index) {
        final artist = _trendingArtists[index];
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            artist.name,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildAlbumGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: _recommendedAlbums.length,
      itemBuilder: (context, index) {
        final album = _recommendedAlbums[index];
        return _buildAlbumCard(album);
      },
    );
  }

  Widget _buildAlbumCard(Album album) {
    return Card(
      color: Colors.deepPurple[900],
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Icon(Icons.album, color: Colors.white54, size: 30),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                album.name,
                style: const TextStyle(color: Colors.white, fontSize: 12, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
              Text(
                album.artist,
                style: const TextStyle(color: Colors.grey, fontSize: 10, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}