import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/space/bloc/space_puzzle_bloc.dart';
import 'package:very_good_slide_puzzle/space/bloc/space_theme_bloc.dart';
import 'package:very_good_slide_puzzle/space/space.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';

/// {@template space_puzzle_action_button}
/// Displays the action button to start or shuffle the puzzle
/// based on the current puzzle state.
/// {@endtemplate}
class SpacePuzzleActionButton extends StatefulWidget {
  /// {@macro space_puzzle_action_button}
  const SpacePuzzleActionButton({Key? key, AudioPlayerFactory? audioPlayer})
      : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<SpacePuzzleActionButton> createState() =>
      _SpacePuzzleActionButtonState();
}

class _SpacePuzzleActionButtonState extends State<SpacePuzzleActionButton> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory()
      ..setAsset('assets/audio/click.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.select((SpaceThemeBloc bloc) => bloc.state.theme);

    final status = context.select((SpacePuzzleBloc bloc) => bloc.state.status);
    final isLoading = status == SpacePuzzleStatus.loading;
    final isStarted = status == SpacePuzzleStatus.started;

    final text = isStarted
        ? context.l10n.spaceRestart
        : (isLoading
            ? context.l10n.spaceGetReady
            : context.l10n.spaceStartGame);

    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Tooltip(
          key: ValueKey(status),
          message: isStarted ? context.l10n.puzzleRestartTooltip : '',
          verticalOffset: 40,
          child: PuzzleButton(
            onPressed: isLoading
                ? null
                : () async {
                    final hasStarted = status == SpacePuzzleStatus.started;

                    // Reset the timer and the countdown.
                    context.read<TimerBloc>().add(const TimerReset());
                    context.read<SpacePuzzleBloc>().add(
                          SpaceCountdownReset(
                            secondsToBegin: hasStarted ? 5 : 3,
                          ),
                        );

                    // Initialize the puzzle board to show the initial puzzle
                    // (unshuffled) before the countdown completes.
                    if (hasStarted) {
                      context.read<PuzzleBloc>().add(
                            const PuzzleInitialized(shufflePuzzle: false),
                          );
                    }

                    unawaited(_audioPlayer.replay());
                  },
            textColor: isLoading ? theme.defaultColor : null,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
