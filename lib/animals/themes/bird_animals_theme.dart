import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/animals/animals.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/space/space.dart';
import 'package:very_good_slide_puzzle/space/themes/space_theme.dart';

/// {@template galaxy_space_theme}
/// The galaxy space puzzle theme.
/// {@endtemplate}
class BirdAnimalsTheme extends AnimalsTheme {
  /// {@macro galaxy_space_theme}
  const BirdAnimalsTheme() : super();

  @override
  String semanticsLabel(BuildContext context) =>
      context.l10n.spaceBlueDashLabelText;

  @override
  Color get backgroundColor => PuzzleColors.bluePrimary;

  @override
  Color get defaultColor => PuzzleColors.blue90;

  @override
  Color get buttonColor => PuzzleColors.blue50;

  @override
  Color get menuInactiveColor => PuzzleColors.blue50;

  @override
  Color get countdownColor => PuzzleColors.blue50;

  @override
  String get themeAsset => 'assets/images/animals/gallery/bird.png';

  @override
  String get successThemeAsset => 'assets/images/animals/gallery/bird.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/blue_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/arcade-game.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/animals/bird';
}