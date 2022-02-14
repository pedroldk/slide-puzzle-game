import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/castles/castles.dart';
import 'package:very_good_slide_puzzle/castles/themes/castles_theme.dart';
import 'package:very_good_slide_puzzle/castles/themes/neuschwanstein_castles_theme.dart';

part 'castles_theme_event.dart';
part 'castles_theme_state.dart';

/// {@template castles_theme_bloc}
/// Bloc responsible for the currently selected [CastlesTheme].
/// {@endtemplate}
class CastlesThemeBloc extends Bloc<CastlesThemeEvent, CastlesThemeState> {
  /// {@macro castles_theme_bloc}
  CastlesThemeBloc({required List<CastlesTheme> themes})
      : super(CastlesThemeState(themes: themes)) {
    on<CastlesThemeChanged>(_onCastlesThemeChanged);
  }

  void _onCastlesThemeChanged(
    CastlesThemeChanged event,
    Emitter<CastlesThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
