import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/zen/zen.dart';
import 'package:very_good_slide_puzzle/zen/themes/zen_theme.dart';

part 'zen_theme_event.dart';
part 'zen_theme_state.dart';

/// {@template zen_theme_bloc}
/// Bloc responsible for the currently selected [ZenTheme].
/// {@endtemplate}
class ZenThemeBloc extends Bloc<ZenThemeEvent, ZenThemeState> {
  /// {@macro zen_theme_bloc}
  ZenThemeBloc({required List<ZenTheme> themes})
      : super(ZenThemeState(themes: themes)) {
    on<ZenThemeChanged>(_onZenThemeChanged);
  }

  void _onZenThemeChanged(
    ZenThemeChanged event,
    Emitter<ZenThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}
