import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/music_control/bloc/music_control_bloc.dart';

/// {@template audio_control}
/// Displays and allows to update the current audio status of the puzzle.
/// {@endtemplate}
class MusicControl extends StatelessWidget {
  /// {@macro audio_control}
  const MusicControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedMusic = context.select((MusicControlBloc bloc) => bloc.state.music);

    final menuItems = <DropdownMenuItem<String>>[
      const DropdownMenuItem(value: 'None', child: Text('None')),
      const DropdownMenuItem(value: 'assets/audio/music/acousticbreeze.mp3', child: Text('Acoustic Breeze')),
      const DropdownMenuItem(value: 'assets/audio/music/adventure.mp3', child: Text('Adventure')),
      const DropdownMenuItem(value: 'assets/audio/music/energy.mp3', child: Text('Energy')),
      const DropdownMenuItem(value: 'assets/audio/music/enigmatic.mp3', child: Text('Enigmatic')),
      const DropdownMenuItem(value: 'assets/audio/music/funkyelement.mp3', child: Text('Funky Element')),
      const DropdownMenuItem(value: 'assets/audio/music/hey.mp3', child: Text('Hey')),
      const DropdownMenuItem(value: 'assets/audio/music/inspire.mp3', child: Text('Inspire')),
      const DropdownMenuItem(value: 'assets/audio/music/littleidea.mp3', child: Text('Little Idea')),
      const DropdownMenuItem(value: 'assets/audio/music/relaxing.mp3', child: Text('Relaxing')),
      const DropdownMenuItem(value: 'assets/audio/music/smile.mp3', child: Text('Smile')),
      const DropdownMenuItem(value: 'assets/audio/music/sunny.mp3', child: Text('Sunny')),
      const DropdownMenuItem(value: 'assets/audio/music/tenderness.mp3', child: Text('Tenderness')),
    ];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Row(
        children: [
          DropdownButton(
            value: selectedMusic,
            items: menuItems,
            onChanged: (value) => context
                .read<MusicControlBloc>()
                .add(MusicChanged(value.toString())),
          )
        ],
      ),
    );
  }
}
