// ignore_for_file: public_member_api_docs

part of 'space_theme_bloc.dart';

class SpaceThemeState extends Equatable {
  const SpaceThemeState({
    required this.themes,
    this.theme = const GalaxySpaceTheme(),
  });

  /// The list of all available [SpaceTheme]s.
  final List<SpaceTheme> themes;

  /// Currently selected [SpaceTheme].
  final SpaceTheme theme;

  @override
  List<Object> get props => [themes, theme];

  SpaceThemeState copyWith({
    List<SpaceTheme>? themes,
    SpaceTheme? theme,
  }) {
    return SpaceThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
