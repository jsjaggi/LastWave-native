import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:lastwave_core/models/track.dart';

/// Controller for managing audio playback state.
/// Uses audio_service's AudioProcessingState for processing state.
class NowPlayingController extends ChangeNotifier {
  Track? _currentTrack;
  AudioProcessingState _processingState = AudioProcessingState.idle;

  Track? get currentTrack => _currentTrack;
  AudioProcessingState get processingState => _processingState;

  void setTrack(Track track) {
    _currentTrack = track;
    _processingState = AudioProcessingState.loading;
    notifyListeners();
  }

  void setPlaying() {
    _processingState = AudioProcessingState.playing;
    notifyListeners();
  }

  void setPaused() {
    _processingState = AudioProcessingState.paused;
    notifyListeners();
  }

  void setStopped() {
    _processingState = AudioProcessingState.idle;
    _currentTrack = null;
    notifyListeners();
  }

  Map<String, dynamic> getNotificationMap() {
    if (_currentTrack == null) return {};

    return {
      'title': _currentTrack!.name,
      'artist': _currentTrack!.artist,
      'album': _currentTrack!.album,
      'duration': _currentTrack!.duration?.inMinutes,
    };
  }
}