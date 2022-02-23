import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Signature for the factory of [AudioPlayer].
typedef MusicPlayerFactory = ValueGetter<MusicPlayer>;

/// Gets a new instance of [AudioPlayer].
MusicPlayer getMusicPlayer() => MusicPlayer();

class MusicPlayer {
  static final MusicPlayer _singleton = MusicPlayer._internal();

  factory MusicPlayer() {
    return _singleton;
  }

  AudioPlayer? audioPlayer = AudioPlayer();

  MusicPlayer._internal();
}
