import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/cities/cities.dart';
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/cities/bloc/cities_theme_bloc.dart';

/// {@template cities_theme_picker}
/// Displays the Cities theme picker to choose between
/// [CitiesThemeState.themes].
///
/// By default allows to choose between [BlueCitiesTheme],
/// [GreenCitiesTheme] or [YellowCitiesTheme].
/// {@endtemplate}
class CitiesThemePicker extends StatefulWidget {
  /// {@macro cities_theme_picker}
  const CitiesThemePicker({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  static const _activeThemeNormalSize = 120.0;
  static const _activeThemeSmallSize = 65.0;
  static const _inactiveThemeNormalSize = 96.0;
  static const _inactiveThemeSmallSize = 50.0;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<CitiesThemePicker> createState() => _CitiesThemePickerState();
}

class _CitiesThemePickerState extends State<CitiesThemePicker> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<CitiesThemeBloc>().state;
    final activeTheme = themeState.theme;

    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: ResponsiveLayoutBuilder(
        small: (_, child) => child!,
        medium: (_, child) => child!,
        large: (_, child) => child!,
        child: (currentSize) {
          final isSmallSize = currentSize == ResponsiveLayoutSize.small;
          final activeSize = isSmallSize
              ? CitiesThemePicker._activeThemeSmallSize
              : CitiesThemePicker._activeThemeNormalSize;
          final inactiveSize = isSmallSize
              ? CitiesThemePicker._inactiveThemeSmallSize
              : CitiesThemePicker._inactiveThemeNormalSize;

          return SizedBox(
            key: const Key('cities_theme_picker'),
            height: activeSize,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                themeState.themes.length,
                (index) {
                  final theme = themeState.themes[index];
                  final isActiveTheme = theme == activeTheme;
                  final padding = index > 0 ? (isSmallSize ? 4.0 : 8.0) : 0.0;
                  final size = isActiveTheme ? activeSize : inactiveSize;

                  return Padding(
                    padding: EdgeInsets.only(left: padding),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        key: Key('cities_theme_picker_$index'),
                        onTap: () async {
                          if (isActiveTheme) {
                            return;
                          }

                          // Update the current Cities theme.
                          context
                              .read<CitiesThemeBloc>()
                              .add(CitiesThemeChanged(themeIndex: index));

                          // Play the audio of the current Cities theme.
                          await _audioPlayer.setAsset(theme.audioAsset);
                          unawaited(_audioPlayer.play());
                        },
                        child: AnimatedContainer(
                          width: size,
                          height: size,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 350),
                          child: Image.asset(
                            theme.themeAsset,
                            fit: BoxFit.fill,
                            semanticLabel: theme.semanticsLabel(context),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
