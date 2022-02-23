import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/dinosaurs/dinosaurs.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/dinosaurs_theme.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template galaxy_dinosaurs_theme}
/// The galaxy dinosaurs puzzle theme.
/// {@endtemplate}
class SeventhDinosaursTheme extends DinosaursTheme {
  /// {@macro galaxy_dinosaurs_theme}
  const SeventhDinosaursTheme() : super();

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
  String get themeAsset =>
      'assets/images/dinosaurs/gallery/dinosaur_seventh.png';

  @override
  String get successThemeAsset =>
      'assets/images/dinosaurs/gallery/dinosaur_seventh.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/blue_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/arcade-game.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/dinosaurs/dinosaur_seventh';
}
