import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/music_control/bloc/music_control_bloc.dart';

/// {@template music_control_listener}
/// Listens to the current audio status and changes [audioPlayer] music accordingly.
/// {@endtemplate}
class MusicControlListener extends StatefulWidget {
  /// {@macro music_control_listener}
  MusicControlListener({Key? key, this.audioPlayer, required this.child})
      : super(key: key);

  /// The audio player to be muted/unmuted when the audio status changes.
  AudioPlayer? audioPlayer;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  State<MusicControlListener> createState() => _MusicControlListenerState();
}

class _MusicControlListenerState extends State<MusicControlListener> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MusicControlListener oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MusicControlBloc, MusicControlState>(
      listener: (context, state) => updateMusicPlayer(music: state.music),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.audioPlayer?.dispose();
    super.dispose();
  }

  void updateMusicPlayer({required String music}) {
    if (widget.audioPlayer != null && widget.audioPlayer!.playing) {
      widget.audioPlayer!.pause();
    }

    if (music != 'None') {
      widget.audioPlayer?.setVolume(0.5);
      widget.audioPlayer?.setAsset(music);
      widget.audioPlayer?.play();
    }
  }
}
