import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/cities/cities.dart';

part 'cities_theme_event.dart';
part 'cities_theme_state.dart';

/// {@template cities_theme_bloc}
/// Bloc responsible for the currently selected [CitiesTheme].
/// {@endtemplate}
class CitiesThemeBloc extends Bloc<CitiesThemeEvent, CitiesThemeState> {
  /// {@macro cities_theme_bloc}
  CitiesThemeBloc({required List<CitiesTheme> themes})
      : super(CitiesThemeState(themes: themes)) {
    on<CitiesThemeChanged>(_onCitiesThemeChanged);
  }

  void _onCitiesThemeChanged(
    CitiesThemeChanged event,
    Emitter<CitiesThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
