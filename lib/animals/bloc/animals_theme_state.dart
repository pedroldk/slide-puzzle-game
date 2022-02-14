// ignore_for_file: public_member_api_docs

part of 'animals_theme_bloc.dart';

class AnimalsThemeState extends Equatable {
  const AnimalsThemeState({
    required this.themes,
    this.theme = const BirdAnimalsTheme(),
  });

  /// The list of all available [AnimalsTheme]s.
  final List<AnimalsTheme> themes;

  /// Currently selected [AnimalsTheme].
  final AnimalsTheme theme;

  @override
  List<Object> get props => [themes, theme];

  AnimalsThemeState copyWith({
    List<AnimalsTheme>? themes,
    AnimalsTheme? theme,
  }) {
    return AnimalsThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
