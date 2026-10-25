# LastWave Flutter iOS Port - Complete Todo List

## Phase 1: Core Structure ✅ DONE
- [x] Flutter project initialized with iOS support
- [x] Core package (lastwave_core) created with models
- [x] Dependency injection (get_it + injectable)
- [x] Material 3 Expressive theme with dynamic_color
- [x] Pubspec.yaml with all dependencies resolved
- [x] GitHub Actions CI/CD workflow
- [x] Codemagic configuration
- [x] ExportOptions.plist configured
- [x] CI_CD_SETUP.md documentation

## Phase 2: Core Features (In Progress)

### Models ✅
- [x] Track - Music track DTOs with Last.fm data
- [x] Artist - Artist models
- [x] Album - Album models
- [x] LyricLine/Syllable - Lyrics data structures
- [x] Scrobble - Scrobbling data
- [x] TasteProfile - User taste profiling

### API Layer ✅
- [x] LastFmApiService - Search, lyrics, scrobbling
- [x] Repository pattern for data access

### Services ✅
- [x] CacheService - With TTL expiration
- [x] RateLimiter - API call throttling

### UI ✅
- [x] HomeScreen - Recommendations, artists, albums grid
- [x] main.dart - GetMaterialApp with localization

## Phase 3: Playback & Audio (NEXT)

### Audio Service
- [ ] just_audio integration for music playback
- [ ] audio_service for background audio + notifications
- [ ] NowPlayingController for media session
- [ ] Lock screen controls support
- [ ] Bluetooth/headset support

### Player UI
- [ ] Mini player widget
- [ ] Now playing screen
- [ ] Progress seek bar
- [ ] Play/pause controls

## Phase 4: Scrobbler & Features

### Last.fm Scrobbler
- [ ] Scrobble track submission
- [ ] Recent tracks fetching
- [ ] Taste profile retrieval

### Additional Features
- [ ] Search functionality
- [ ] Library view
- [ ] Playlists
- [ ] Settings with DataStore
- [ ] Secure storage for auth tokens

## Phase 5: iOS Build & Distribution

### Local Build
- [ ] flutter build ipa --debug
- [ ] Verify no errors
- [ ] Test on iOS simulator if Mac available

### Cloud Build (GitHub Actions)
- [ ] Configure secrets (APP_STORE_CONNECT_API_KEY, etc.)
- [ ] Push tag to trigger workflow
- [ ] Download IPA from artifacts

### Codemagic Build
- [ ] Add environment variables in Codemagic UI
- [ ] Start new build → ios-release workflow
- [ ] Download IPA from build output

### App Store Connect
- [ ] Create app record in App Store Connect
- [ ] Upload IPA via Application Loader or Codemagic
- [ ] Add build information
- [ ] Submit for review
- [ ] Set up TestFlight for testing

## Quick Start Commands

### Local Testing
```bash
flutter pub get
flutter test
flutter run  # For Android/web
```

### GitHub Actions Trigger
```bash
git tag v4.3.1
git push origin v4.3.1
```

### Codemagic Manual Build
1. Go to codemagic.io
2. Click "Start new build"
3. Select "ios-release" workflow
4. Wait for completion
5. Download IPA from artifacts

## Estimated Time
- **Core features**: ~2 weeks (already done)
- **Playback**: ~3-5 days
- **Scrobbler**: ~2-3 days
- **iOS Build**: ~15 minutes (cloud) / depends on Mac
- **App Store**: ~2-7 days review time

## Next Immediate Steps
1. Test current Flutter app runs without errors
2. Set up audio service for playback
3. Create basic player UI
4. Test iOS build (via Codemagic or GitHub Actions)
5. Submit to TestFlight

---
*This file tracks progress through the iOS port migration*