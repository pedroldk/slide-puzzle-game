import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/space/bloc/space_puzzle_bloc.dart';
import 'package:very_good_slide_puzzle/space/space.dart';
import 'package:very_good_slide_puzzle/space/widgets/space_puzzle_action_button.dart';
import 'package:very_good_slide_puzzle/space/widgets/space_timer.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';

/// {@template space_start_section}
/// Displays the start section of the puzzle based on [state].
/// {@endtemplate}
class SpaceStartSection extends StatelessWidget {
  /// {@macro space_start_section}
  const SpaceStartSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  /// The state of the puzzle.
  final PuzzleState state;

  @override
  Widget build(BuildContext context) {
    final status = context.select((SpacePuzzleBloc bloc) => bloc.state.status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveGap(
          small: 20,
          medium: 83,
          large: 151,
        ),
        PuzzleName(
          key: puzzleNameKey,
        ),
        const ResponsiveGap(large: 16),
        PuzzleTitle(
          key: puzzleTitleKey,
          title: context.l10n.puzzleChallengeTitle,
        ),
        const ResponsiveGap(
          small: 12,
          medium: 16,
          large: 32,
        ),
        NumberOfMovesAndTilesLeft(
          key: numberOfMovesAndTilesLeftKey,
          numberOfMoves: state.numberOfMoves,
          numberOfTilesLeft: status == SpacePuzzleStatus.started
              ? state.numberOfTilesLeft
              : state.puzzle.tiles.length - 1,
        ),
        const ResponsiveGap(
          small: 8,
          medium: 18,
          large: 32,
        ),
        ResponsiveLayoutBuilder(
          small: (_, __) => const SizedBox(),
          medium: (_, __) => const SizedBox(),
          large: (_, __) => const SpacePuzzleActionButton(),
        ),
        ResponsiveLayoutBuilder(
          small: (_, __) => const SpaceTimer(),
          medium: (_, __) => const SpaceTimer(),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(small: 12),
      ],
    );
  }
}
