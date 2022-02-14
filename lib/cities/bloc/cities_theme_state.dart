// ignore_for_file: public_member_api_docs

part of 'cities_theme_bloc.dart';

class CitiesThemeState extends Equatable {
  const CitiesThemeState({
    required this.themes,
    this.theme = const ParisCitiesTheme(),
  });

  /// The list of all available [CitiesTheme]s.
  final List<CitiesTheme> themes;

  /// Currently selected [CitiesTheme].
  final CitiesTheme theme;

  @override
  List<Object> get props => [themes, theme];

  CitiesThemeState copyWith({
    List<CitiesTheme>? themes,
    CitiesTheme? theme,
  }) {
    return CitiesThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
