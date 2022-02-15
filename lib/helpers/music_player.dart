import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Signature for the factory of [AudioPlayer].
typedef MusicPlayerFactory = ValueGetter<MusicPlayer>;

/// Gets a new instance of [AudioPlayer].
MusicPlayer getMusicPlayer() => MusicPlayer(AudioPlayer());

class MusicPlayer {
  MusicPlayer(AudioPlayer audioPlayer) {
    this.audioPlayer = audioPlayer;
  }

  AudioPlayer? audioPlayer;
}
