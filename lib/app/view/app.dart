// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: public_member_api_docs, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:very_good_slide_puzzle/helpers/helpers.dart';
import 'package:very_good_slide_puzzle/l10n/l10n.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';

class App extends StatefulWidget {
  const App({Key? key, ValueGetter<PlatformHelper>? platformHelperFactory})
      : _platformHelperFactory = platformHelperFactory ?? getPlatformHelper,
        super(key: key);

  final ValueGetter<PlatformHelper> _platformHelperFactory;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The path to local assets folder.
  static const localAssetsPrefix = 'assets/';

  static final audioControlAssets = [
    'assets/images/audio_control/simple_on.png',
    'assets/images/audio_control/simple_off.png',
    'assets/images/audio_control/dashatar_on.png',
    'assets/images/audio_control/space_on.png',
    'assets/images/audio_control/green_dashatar_off.png',
    'assets/images/audio_control/blue_dashatar_off.png',
    'assets/images/audio_control/yellow_dashatar_off.png',
  ];

  static final audioAssets = [
    'assets/audio/shuffle.mp3',
    'assets/audio/click.mp3',
    'assets/audio/dumbbell.mp3',
    'assets/audio/sandwich.mp3',
    'assets/audio/skateboard.mp3',
    'assets/audio/success.mp3',
    'assets/audio/tile_move.mp3',
  ];

  late final PlatformHelper _platformHelper;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _platformHelper = widget._platformHelperFactory();

    _timer = Timer(const Duration(milliseconds: 20), () {
      for (var i = 1; i <= 15; i++) {
        precacheImage(
          Image.asset('assets/images/dashatar/green/$i.png').image,
          context,
        );
        precacheImage(
          Image.asset('assets/images/dashatar/blue/$i.png').image,
          context,
        );
        precacheImage(
          Image.asset('assets/images/dashatar/yellow/$i.png').image,
          context,
        );
        precacheAnimalsTheme('animals', i);
        precacheCastlesTheme('castles', i);
        precacheCitiesTheme('cities', i);
        precacheDinosaursTheme('dinosaurs', i);
        precacheSpaceTheme('space', i);
        precacheZenTheme('zen', i);
      }
      precacheImage(
        Image.asset('assets/images/dashatar/gallery/green.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/dashatar/success/green.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/dashatar/gallery/blue.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/dashatar/success/blue.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/dashatar/gallery/yellow.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/dashatar/success/yellow.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/constellations_first.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/constellations_first.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/galaxy_first.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/galaxy_first.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/galaxy_second.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/galaxy_second.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/galaxy_third.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/galaxy_third.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/milkyway.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/milkyway.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/moon.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/moon.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/night.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/night.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/gallery/orion.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/space/success/orion.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/logo_flutter_color.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/logo_flutter_white.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/shuffle_icon.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/timer_icon.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/simple_dash_large.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/simple_dash_medium.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/simple_dash_small.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/twitter_icon.png').image,
        context,
      );
      precacheImage(
        Image.asset('assets/images/facebook_icon.png').image,
        context,
      );

      for (final audioControlAsset in audioControlAssets) {
        precacheImage(
          Image.asset(audioControlAsset).image,
          context,
        );
      }

      for (final audioAsset in audioAssets) {
        prefetchToMemory(audioAsset);
      }
    });
  }

  void precacheCitiesTheme(String themeFolder, int i) {
    precacheImage(
      Image.asset('assets/images/$themeFolder/buildings_first/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/buildings_second/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/city/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/kuala/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/paris/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/pedestrians/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/river/$i.png').image,
      context,
    );
  }

  void precacheCastlesTheme(String themeFolder, int i) {
    precacheImage(
      Image.asset('assets/images/$themeFolder/architecture/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/castle_first/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/castle_second/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/fairytale/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/heaven/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/moon/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/neuschwanstein/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/water/$i.png').image,
      context,
    );
  }

  void precacheDinosaursTheme(String themeFolder, int i) {
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_first/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_second/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_third/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_fourth/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_fifth/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_sixth/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_seventh/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/dinosaur_eighth/$i.png').image,
      context,
    );
  }

  void precacheZenTheme(String themeFolder, int i) {
    precacheImage(
      Image.asset('assets/images/$themeFolder/abstract/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/beach/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/buddha_first/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/buddha_second/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/buddha_third/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/frogs/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/meditate/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/stones/$i.png').image,
      context,
    );
  }

  void precacheAnimalsTheme(String themeFolder, int i) {
    precacheImage(
      Image.asset('assets/images/$themeFolder/bird/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/cat/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/guinea/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/horse/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/penguin/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/rabbit/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/tiger/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/turtle/$i.png').image,
      context,
    );
  }

  void precacheSpaceTheme(String themeFolder, int i) {
    precacheImage(
      Image.asset('assets/images/$themeFolder/constellations_first/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/galaxy_first/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/galaxy_second/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/galaxy_third/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/milkyway/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/moon/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/night/$i.png').image,
      context,
    );
    precacheImage(
      Image.asset('assets/images/$themeFolder/orion/$i.png').image,
      context,
    );
  }

  /// Prefetches the given [filePath] to memory.
  Future<void> prefetchToMemory(String filePath) async {
    if (_platformHelper.isWeb) {
      // We rely on browser caching here. Once the browser downloads the file,
      // the native implementation should be able to access it from cache.
      await http.get(Uri.parse('$localAssetsPrefix$filePath'));
      return;
    }
    throw UnimplementedError(
      'The function `prefetchToMemory` is not implemented '
      'for platforms other than Web.',
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const PuzzlePage(),
    );
  }
}
