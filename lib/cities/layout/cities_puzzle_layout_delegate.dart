import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/cities/cities.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';

/// {@template cities_puzzle_layout_delegate}
/// A delegate for computing the layout of the puzzle UI
/// that uses a [CitiesTheme].
/// {@endtemplate}
class CitiesPuzzleLayoutDelegate extends PuzzleLayoutDelegate {
  /// {@macro cities_puzzle_layout_delegate}
  const CitiesPuzzleLayoutDelegate();

  @override
  Widget startSectionBuilder(PuzzleState state) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => Padding(
        padding: const EdgeInsets.only(left: 50, right: 32),
        child: child,
      ),
      child: (_) => CitiesStartSection(state: state),
    );
  }

  @override
  Widget endSectionBuilder(PuzzleState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const ResponsiveGap(
          small: 23,
          medium: 32,
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const CitiesPuzzleActionButton(),
          medium: (_, child) => const CitiesPuzzleActionButton(),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 54,
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const CitiesThemePicker(),
          medium: (_, child) => const CitiesThemePicker(),
          large: (_, child) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 54,
        ),
        const ResponsiveGap(
          large: 130,
        ),
        const CitiesCountdown(),
      ],
    );
  }

  @override
  Widget backgroundBuilder(PuzzleState state) {
    return Positioned(
      bottom: 74,
      right: 50,
      child: ResponsiveLayoutBuilder(
        small: (_, child) => const SizedBox(),
        medium: (_, child) => const SizedBox(),
        large: (_, child) => const CitiesThemePicker(),
      ),
    );
  }

  @override
  Widget boardBuilder(int size, List<Widget> tiles) {
    return Stack(
      children: [
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          child: ResponsiveLayoutBuilder(
            small: (_, child) => const SizedBox(),
            medium: (_, child) => const SizedBox(),
            large: (_, child) => const CitiesTimer(),
          ),
        ),
        Column(
          children: [
            const ResponsiveGap(
              small: 21,
              medium: 34,
              large: 96,
            ),
            CitiesPuzzleBoard(tiles: tiles),
            const ResponsiveGap(
              large: 96,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget tileBuilder(Tile tile, PuzzleState state) {
    return CitiesPuzzleTile(
      tile: tile,
      state: state,
    );
  }

  @override
  Widget whitespaceTileBuilder() {
    return const SizedBox();
  }

  @override
  List<Object?> get props => [];
}
