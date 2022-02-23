import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/dinosaurs/dinosaurs.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/dinosaurs_theme.dart';
import 'package:very_good_slide_puzzle/dinosaurs/themes/first_theme.dart';

part 'dinosaurs_theme_event.dart';
part 'dinosaurs_theme_state.dart';

/// {@template dinosaurs_theme_bloc}
/// Bloc responsible for the currently selected [DinosaursTheme].
/// {@endtemplate}
class DinosaursThemeBloc
    extends Bloc<DinosaursThemeEvent, DinosaursThemeState> {
  /// {@macro dinosaurs_theme_bloc}
  DinosaursThemeBloc({required List<DinosaursTheme> themes})
      : super(DinosaursThemeState(themes: themes)) {
    on<DinosaursThemeChanged>(_onDinosaursThemeChanged);
  }

  void _onDinosaursThemeChanged(
    DinosaursThemeChanged event,
    Emitter<DinosaursThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
