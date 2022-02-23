import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/castles/bloc/castles_puzzle_bloc.dart';
import 'package:very_good_slide_puzzle/castles/bloc/castles_theme_bloc.dart';
import 'package:very_good_slide_puzzle/castles/castles.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';

/// {@template castles_puzzle_action_button}
/// Displays the action button to start or shuffle the puzzle
/// based on the current puzzle state.
/// {@endtemplate}
class CastlesPuzzleActionButton extends StatefulWidget {
  /// {@macro castles_puzzle_action_button}
  const CastlesPuzzleActionButton({Key? key, AudioPlayerFactory? audioPlayer})
      : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<CastlesPuzzleActionButton> createState() =>
      _CastlesPuzzleActionButtonState();
}

class _CastlesPuzzleActionButtonState extends State<CastlesPuzzleActionButton> {
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
    final theme = context.select((CastlesThemeBloc bloc) => bloc.state.theme);

    final status =
        context.select((CastlesPuzzleBloc bloc) => bloc.state.status);
    final isLoading = status == CastlesPuzzleStatus.loading;
    final isStarted = status == CastlesPuzzleStatus.started;

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
                    final hasStarted = status == CastlesPuzzleStatus.started;

                    // Reset the timer and the countdown.
                    context.read<TimerBloc>().add(const TimerReset());
                    context.read<CastlesPuzzleBloc>().add(
                          CastlesCountdownReset(
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
