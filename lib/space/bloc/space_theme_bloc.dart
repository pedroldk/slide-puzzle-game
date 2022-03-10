import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/space/space.dart';

part 'space_theme_event.dart';
part 'space_theme_state.dart';

/// {@template space_theme_bloc}
/// Bloc responsible for the currently selected [SpaceTheme].
/// {@endtemplate}
class SpaceThemeBloc extends Bloc<SpaceThemeEvent, SpaceThemeState> {
  /// {@macro space_theme_bloc}
  SpaceThemeBloc({required List<SpaceTheme> themes})
      : super(SpaceThemeState(themes: themes)) {
    on<SpaceThemeChanged>(_onSpaceThemeChanged);
  }

  void _onSpaceThemeChanged(
    SpaceThemeChanged event,
    Emitter<SpaceThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
