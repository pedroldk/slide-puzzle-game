import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/colors/colors.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/zen/themes/zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/zen.dart';

/// {@template galaxy_zen_theme}
/// The galaxy zen puzzle theme.
/// {@endtemplate}
class BuddhaSecondZenTheme extends ZenTheme {
  /// {@macro galaxy_zen_theme}
  const BuddhaSecondZenTheme() : super();

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
  String get themeAsset => 'assets/images/zen/gallery/buddha_second.png';

  @override
  String get successThemeAsset => 'assets/images/zen/gallery/buddha_second.png';

  @override
  String get audioControlOffAsset =>
      'assets/images/audio_control/blue_dashatar_off.png';

  @override
  String get audioAsset => 'assets/audio/arcade-game.mp3';

  @override
  String get dashAssetsDirectory => 'assets/images/zen/buddha_second';
}
