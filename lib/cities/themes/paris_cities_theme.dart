import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/cities/cities.dart';
import 'package:very_good_slide_puzzle/cities/themes/cities_theme.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

/// {@template galaxy_cities_theme}
/// The galaxy cities puzzle theme.
/// {@endtemplate}
class ParisCitiesTheme extends CitiesTheme {
  /// {@macro galaxy_cities_theme}
  const ParisCitiesTheme() : super();

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
  String get themeAsset => 'assets/images/cities/gallery/paris.png';

  @override
  String get successThemeAsset => 'assets/images/cities/gallery/paris.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/blue_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/arcade-game.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/cities/paris';
}
