import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Signature for the factory of [AudioPlayer].
typedef MusicPlayerFactory = ValueGetter<MusicPlayer>;

/// Gets a new instance of [AudioPlayer].
MusicPlayer getMusicPlayer() => MusicPlayer();

/// Music player.
class MusicPlayer {
  /// Gets the singleton instance of [MusicPlayer].
  factory MusicPlayer() => _singleton;

  MusicPlayer._internal();

  static final MusicPlayer _singleton = MusicPlayer._internal();

  /// The [AudioPlayer] instance.
  AudioPlayer? audioPlayer = AudioPlayer();

}
