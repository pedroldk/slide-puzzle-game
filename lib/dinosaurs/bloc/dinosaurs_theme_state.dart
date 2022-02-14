// ignore_for_file: public_member_api_docs

part of 'dinosaurs_theme_bloc.dart';

class DinosaursThemeState extends Equatable {
  const DinosaursThemeState({
    required this.themes,
    this.theme = const FirstDinosaursTheme(),
  });

  /// The list of all available [DinosaursTheme]s.
  final List<DinosaursTheme> themes;

  /// Currently selected [DinosaursTheme].
  final DinosaursTheme theme;

  @override
  List<Object> get props => [themes, theme];

  DinosaursThemeState copyWith({
    List<DinosaursTheme>? themes,
    DinosaursTheme? theme,
  }) {
    return DinosaursThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
