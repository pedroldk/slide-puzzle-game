import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:very_good_slide_puzzle/animals/animals.dart';
import 'package:very_good_slide_puzzle/animals/themes/cat_animals_theme.dart';
import 'package:very_good_slide_puzzle/animals/themes/guinea_animals_theme.dart';
import 'package:very_good_slide_puzzle/animals/themes/horse_animals_theme.dart';
import 'package:very_good_slide_puzzle/animals/themes/penguin_animals_theme.dart';
import 'package:very_good_slide_puzzle/animals/themes/rabbit_animals_theme.dart';
import 'package:very_good_slide_puzzle/animals/themes/tiger_animals_theme.dart';
import 'package:very_good_slide_puzzle/animals/themes/turtle_animals_theme.dart';
import 'package:very_good_slide_puzzle/audio_control/audio_control.dart';
import 'package:very_good_slide_puzzle/castles/bloc/castles_theme_bloc.dart';
import 'package:very_good_slide_puzzle/castles/castles.dart';
import 'package:very_good_slide_puzzle/castles/themes/castle_first_castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/castle_second_castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/fairytale_castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/heaven_castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/moon_castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/neuschwanstein_castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/water_castles_theme.dart';
import 'package:very_good_slide_puzzle/cities/bloc/cities_theme_bloc.dart';
import 'package:very_good_slide_puzzle/cities/cities.dart';
import 'package:very_good_slide_puzzle/cities/themes/buildings_first_cities_theme.dart';
import 'package:very_good_slide_puzzle/cities/themes/buildings_second_cities_theme.dart';
import 'package:very_good_slide_puzzle/cities/themes/city_cities_theme.dart';
import 'package:very_good_slide_puzzle/cities/themes/kuala_cities_theme.dart';
import 'package:very_good_slide_puzzle/cities/themes/pedestrians_cities_theme.dart';
import 'package:very_good_slide_puzzle/cities/themes/river_cities_theme.dart';
import 'package:very_good_slide_puzzle/dashatar/dashatar.dart';
import 'package:very_good_slide_puzzle/dinosaurs/bloc/dinosaurs_theme_bloc.dart';
import 'package:very_good_slide_puzzle/dinosaurs/dinosaurs.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/eighth_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/fifth_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/fourth_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/second_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/seventh_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/sixth_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/third_theme.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/music_control/bloc/music_control_bloc.dart';
import 'package:very_good_slide_puzzle/music_control/music_control.dart';
import 'package:very_good_slide_puzzle/music_control/widget/music_control.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/simple/simple.dart';
import 'package:very_good_slide_puzzle/space/bloc/space_puzzle_bloc.dart';
import 'package:very_good_slide_puzzle/space/bloc/space_theme_bloc.dart';
import 'package:very_good_slide_puzzle/space/themes/constellations_first_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/galaxy_first_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/galaxy_second_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/galaxy_third_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/milkyway_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/moon_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/night_space_theme.dart';
import 'package:very_good_slide_puzzle/space/themes/orion_space_theme.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';
import 'package:very_good_slide_puzzle/typography/typography.dart';
import 'package:very_good_slide_puzzle/zen/bloc/bloc.dart';
import 'package:very_good_slide_puzzle/zen/bloc/zen_theme_bloc.dart';
import 'package:very_good_slide_puzzle/zen/themes/abstract_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/beach_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/buddha_first_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/buddha_second_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/buddha_third_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/frogs_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/meditate_zen_theme.dart';
import 'package:very_good_slide_puzzle/zen/themes/stones_zen_theme.dart';

/// {@template puzzle_page}
/// The root page of the puzzle UI.
///
/// Builds the puzzle based on the current [PuzzleTheme]
/// from [ThemeBloc].
/// {@endtemplate}
class PuzzlePage extends StatelessWidget {
  /// {@macro puzzle_page}
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DashatarThemeBloc(
            themes: const [
              BlueDashatarTheme(),
              GreenDashatarTheme(),
              YellowDashatarTheme(),
            ],
          ),
        ),
        BlocProvider(
          create: (_) => SpaceThemeBloc(
            themes: const [
              ConstellationsFirstSpaceTheme(),
              GalaxyFirstSpaceTheme(),
              GalaxySecondSpaceTheme(),
              GalaxyThirdSpaceTheme(),
              MilkywaySpaceTheme(),
              MoonSpaceTheme(),
              NightSpaceTheme(),
              OrionSpaceTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => AnimalsThemeBloc(
            themes: const [
              BirdAnimalsTheme(),
              CatAnimalsTheme(),
              GuineaAnimalsTheme(),
              HorseAnimalsTheme(),
              PenguinAnimalsTheme(),
              RabbitAnimalsTheme(),
              TigerAnimalsTheme(),
              TurtleAnimalsTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => CastlesThemeBloc(
            themes: const [
              ArchitectureCastlesTheme(),
              CastleFirstCastlesTheme(),
              CastleSecondCastlesTheme(),
              FairytaleCastlesTheme(),
              HeavenCastlesTheme(),
              MoonCastlesTheme(),
              NeuschwansteinCastlesTheme(),
              WaterCastlesTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => CitiesThemeBloc(
            themes: const [
              BuildingsFirstCitiesTheme(),
              BuildingsSecondCitiesTheme(),
              CityCitiesTheme(),
              KualaCitiesTheme(),
              ParisCitiesTheme(),
              PedestriansCitiesTheme(),
              RiverCitiesTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => DinosaursThemeBloc(
            themes: const [
              FirstDinosaursTheme(),
              SecondDinosaursTheme(),
              ThirdDinosaursTheme(),
              FourthDinosaursTheme(),
              FifthDinosaursTheme(),
              SixthDinosaursTheme(),
              SeventhDinosaursTheme(),
              EighthDinosaursTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => ZenThemeBloc(
            themes: const [
              AbstractZenTheme(),
              BeachZenTheme(),
              BuddhaFirstZenTheme(),
              BuddhaSecondZenTheme(),
              BuddhaThirdZenTheme(),
              FrogsZenTheme(),
              MeditateZenTheme(),
              StonesZenTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => DashatarPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => AnimalsPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => CastlesPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => CitiesPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => DinosaursPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => SpacePuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => ZenPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(
            initialThemes: [
              const SimpleTheme(),
              context.read<DashatarThemeBloc>().state.theme,
              context.read<SpaceThemeBloc>().state.theme,
              context.read<AnimalsThemeBloc>().state.theme,
              context.read<CastlesThemeBloc>().state.theme,
              context.read<CitiesThemeBloc>().state.theme,
              context.read<DinosaursThemeBloc>().state.theme,
              context.read<ZenThemeBloc>().state.theme,
            ],
          ),
        ),
        BlocProvider(
          create: (_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => AudioControlBloc(),
        ),
        BlocProvider(
          create: (_) => MusicControlBloc(),
        ),
      ],
      child: const PuzzleView(),
    );
  }
}

/// {@template puzzle_view}
/// Displays the content for the [PuzzlePage].
/// {@endtemplate}
class PuzzleView extends StatelessWidget {
  /// {@macro puzzle_view}
  const PuzzleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    /// Shuffle only if the current theme is Simple.
    final shufflePuzzle = theme is SimpleTheme;

    return Scaffold(
      body: AnimatedContainer(
        duration: PuzzleThemeAnimationDuration.backgroundColorChange,
        decoration: BoxDecoration(color: theme.backgroundColor),
        child: MultiBlocListener(
          listeners: [
                BlocListener<DashatarThemeBloc, DashatarThemeState>(
                listener: (context, state) {
            final dashatarTheme = context.read<DashatarThemeBloc>().state.theme;
            context.read<ThemeBloc>().add(ThemeUpdated(theme: dashatarTheme));
            },),
            BlocListener<SpaceThemeBloc, SpaceThemeState>(
            listener: (context, state) {
              final spaceTheme = context.read<SpaceThemeBloc>().state.theme;
              context.read<ThemeBloc>().add(ThemeUpdated(theme: spaceTheme));
            },),
            BlocListener<AnimalsThemeBloc, AnimalsThemeState>(
              listener: (context, state) {
                final animalsTheme = context.read<AnimalsThemeBloc>().state.theme;
                context.read<ThemeBloc>().add(ThemeUpdated(theme: animalsTheme));
              },),
            BlocListener<CastlesThemeBloc, CastlesThemeState>(
              listener: (context, state) {
                final castlesTheme = context.read<CastlesThemeBloc>().state.theme;
                context.read<ThemeBloc>().add(ThemeUpdated(theme: castlesTheme));
              },),
            BlocListener<CitiesThemeBloc, CitiesThemeState>(
              listener: (context, state) {
                final citiesTheme = context.read<CitiesThemeBloc>().state.theme;
                context.read<ThemeBloc>().add(ThemeUpdated(theme: citiesTheme));
              },),
            BlocListener<DinosaursThemeBloc, DinosaursThemeState>(
              listener: (context, state) {
                final dinosaursTheme = context.read<DinosaursThemeBloc>().state.theme;
                context.read<ThemeBloc>().add(ThemeUpdated(theme: dinosaursTheme));
              },),
            BlocListener<ZenThemeBloc, ZenThemeState>(
              listener: (context, state) {
                final zenTheme = context.read<ZenThemeBloc>().state.theme;
                context.read<ThemeBloc>().add(ThemeUpdated(theme: zenTheme));
              },)
          ]
        ,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TimerBloc(
                  ticker: const Ticker(),
                ),
              ),
              BlocProvider(
                create: (context) => PuzzleBloc(4)
                  ..add(
                    PuzzleInitialized(
                      shufflePuzzle: shufflePuzzle,
                    ),
                  ),
              ),
            ],
            child: const _Puzzle(
              key: Key('puzzle_view_puzzle'),
            ),
          ),
        ),
      ),
    );
  }
}

class _Puzzle extends StatelessWidget {
  const _Puzzle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            if (theme is SimpleTheme)
              theme.layoutDelegate.backgroundBuilder(state),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  children: const [
                    PuzzleHeader(),
                    PuzzleSections(),
                  ],
                ),
              ),
            ),
            if (theme is! SimpleTheme)
              theme.layoutDelegate.backgroundBuilder(state),
          ],
        );
      },
    );
  }
}

/// {@template puzzle_header}
/// Displays the header of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleHeader extends StatelessWidget {
  /// {@macro puzzle_header}
  const PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ResponsiveLayoutBuilder(
        small: (context, child) => Stack(
          children: [
            const Align(
              child: PuzzleLogo(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 34),
                child: AudioControl(key: audioControlKey),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 34),
                child: MusicControl(key: musicControlKey),
              ),
            )
          ],
        ),
        medium: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PuzzleLogo(),
            ],
          ),
        ),
        large: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PuzzleLogo(),
              PuzzleMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

/// {@template puzzle_logo}
/// Displays the logo of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleLogo extends StatelessWidget {
  /// {@macro puzzle_logo}
  const PuzzleLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return AppFlutterLogo(
      key: puzzleLogoKey,
      isColored: theme.isLogoColored,
    );
  }
}

/// {@template puzzle_sections}
/// Displays start and end sections of the puzzle.
/// {@endtemplate}
class PuzzleSections extends StatelessWidget {
  /// {@macro puzzle_sections}
  const PuzzleSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: [
          theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      medium: (context, child) => Column(
        children: [
          theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      large: (context, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: theme.layoutDelegate.startSectionBuilder(state),
          ),
          const PuzzleBoard(),
          Expanded(
            child: theme.layoutDelegate.endSectionBuilder(state),
          ),
        ],
      ),
    );
  }
}

/// {@template puzzle_board}
/// Displays the board of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleBoard extends StatelessWidget {
  /// {@macro puzzle_board}
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final puzzle = context.select((PuzzleBloc bloc) => bloc.state.puzzle);

    final size = puzzle.getDimension();
    if (size == 0) return const CircularProgressIndicator();

    return PuzzleKeyboardHandler(
      child: BlocListener<PuzzleBloc, PuzzleState>(
        listener: (context, state) {
          if (theme.hasTimer && state.puzzleStatus == PuzzleStatus.complete) {
            context.read<TimerBloc>().add(const TimerStopped());
          }
        },
        child: theme.layoutDelegate.boardBuilder(
          size,
          puzzle.tiles
              .map(
                (tile) => _PuzzleTile(
                  key: Key('puzzle_tile_${tile.value.toString()}'),
                  tile: tile,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _PuzzleTile extends StatelessWidget {
  const _PuzzleTile({
    Key? key,
    required this.tile,
  }) : super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return tile.isWhitespace
        ? theme.layoutDelegate.whitespaceTileBuilder()
        : theme.layoutDelegate.tileBuilder(tile, state);
  }
}

/// {@template puzzle_menu}
/// Displays the menu of the puzzle.
/// {@endtemplate}
@visibleForTesting
class PuzzleMenu extends StatelessWidget {
  /// {@macro puzzle_menu}
  const PuzzleMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themes = context.select((ThemeBloc bloc) => bloc.state.themes);

    return SingleChildScrollView(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          themes.length,
          (index) => PuzzleMenuItem(
            theme: themes[index],
            themeIndex: index,
          ),
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const SizedBox(),
          medium: (_, child) => child!,
          large: (_, child) => child!,
          child: (currentSize) {
            return SingleChildScrollView(child: Row(
              children: [
                const Gap(44),
                AudioControl(
                  key: audioControlKey,
                ),
                MusicControl(
                  key: musicControlKey,
                ),
                MusicControlListener(
                  key: const Key('music_player'),
                  audioPlayer: AudioPlayer(),
                  child: const Tooltip(
                  message: '',),),
              ],
            ),);
          },
        ),
      ],
    ),);
  }
}

/// {@template puzzle_menu_item}
/// Displays the menu item of the [PuzzleMenu].
/// {@endtemplate}
@visibleForTesting
class PuzzleMenuItem extends StatelessWidget {
  /// {@macro puzzle_menu_item}
  const PuzzleMenuItem({
    Key? key,
    required this.theme,
    required this.themeIndex,
  }) : super(key: key);

  /// The theme corresponding to this menu item.
  final PuzzleTheme theme;

  /// The index of [theme] in [ThemeState.themes].
  final int themeIndex;

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final isCurrentTheme = theme == currentTheme;

    return ResponsiveLayoutBuilder(
      small: (_, child) => SingleChildScrollView(child: Column(
        children: [
          Container(
            width: 80,
            height: 40,
            decoration: isCurrentTheme
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: currentTheme.menuUnderlineColor,
                      ),
                    ),
                  )
                : null,
            child: child,
          ),
        ],
      )),
      medium: (_, child) => child!,
      large: (_, child) => child!,
      child: (currentSize) {
        final leftPadding =
            themeIndex > 0 && currentSize != ResponsiveLayoutSize.small
                ? 40.0
                : 0.0;

        return Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: Tooltip(
            message:
                theme != currentTheme ? context.l10n.puzzleChangeTooltip : '',
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ).copyWith(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                // Ignore if this theme is already selected.
                if (theme == currentTheme) {
                  return;
                }

                // Update the currently selected theme.
                context
                    .read<ThemeBloc>()
                    .add(ThemeChanged(themeIndex: themeIndex));

                // Reset the timer of the currently running puzzle.
                context.read<TimerBloc>().add(const TimerReset());

                // Stop the Dashatar countdown if it has been started.
                context.read<DashatarPuzzleBloc>().add(
                      const DashatarCountdownStopped(),
                    );

                // Initialize the puzzle board for the newly selected theme.
                context.read<PuzzleBloc>().add(
                      PuzzleInitialized(
                        shufflePuzzle: theme is SimpleTheme,
                      ),
                    );
              },
              child: AnimatedDefaultTextStyle(
                duration: PuzzleThemeAnimationDuration.textStyle,
                style: PuzzleTextStyle.headline5.copyWith(
                  color: isCurrentTheme
                      ? currentTheme.menuActiveColor
                      : currentTheme.menuInactiveColor,
                ),
                child: Text(theme.name),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// The global key of [PuzzleLogo].
///
/// Used to animate the transition of [PuzzleLogo] when changing a theme.
final puzzleLogoKey = GlobalKey(debugLabel: 'puzzle_logo');

/// The global key of [PuzzleName].
///
/// Used to animate the transition of [PuzzleName] when changing a theme.
final puzzleNameKey = GlobalKey(debugLabel: 'puzzle_name');

/// The global key of [PuzzleTitle].
///
/// Used to animate the transition of [PuzzleTitle] when changing a theme.
final puzzleTitleKey = GlobalKey(debugLabel: 'puzzle_title');

/// The global key of [NumberOfMovesAndTilesLeft].
///
/// Used to animate the transition of [NumberOfMovesAndTilesLeft]
/// when changing a theme.
final numberOfMovesAndTilesLeftKey =
    GlobalKey(debugLabel: 'number_of_moves_and_tiles_left');

/// The global key of [AudioControl].
///
/// Used to animate the transition of [AudioControl]
/// when changing a theme.
final audioControlKey = GlobalKey(debugLabel: 'audio_control');

// The global key of [MusicControl].
///
/// Used to animate the transition of [MusicControl]
/// when changing a theme.
final musicControlKey = GlobalKey(debugLabel: 'music_control');
