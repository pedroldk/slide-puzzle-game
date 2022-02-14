import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/animals/animals.dart';
import 'package:very_good_slide_puzzle/animals/themes/animals_theme.dart';

part 'animals_theme_event.dart';
part 'animals_theme_state.dart';

/// {@template animals_theme_bloc}
/// Bloc responsible for the currently selected [AnimalsTheme].
/// {@endtemplate}
class AnimalsThemeBloc extends Bloc<AnimalsThemeEvent, AnimalsThemeState> {
  /// {@macro animals_theme_bloc}
  AnimalsThemeBloc({required List<AnimalsTheme> themes})
      : super(AnimalsThemeState(themes: themes)) {
    on<AnimalsThemeChanged>(_onAnimalsThemeChanged);
  }

  void _onAnimalsThemeChanged(
    AnimalsThemeChanged event,
    Emitter<AnimalsThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
