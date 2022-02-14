// ignore_for_file: public_member_api_docs

part of 'castles_theme_bloc.dart';

class CastlesThemeState extends Equatable {
  const CastlesThemeState({
    required this.themes,
    this.theme = const NeuschwansteinCastlesTheme(),
  });

  /// The list of all available [CastlesTheme]s.
  final List<CastlesTheme> themes;

  /// Currently selected [CastlesTheme].
  final CastlesTheme theme;

  @override
  List<Object> get props => [themes, theme];

  CastlesThemeState copyWith({
    List<CastlesTheme>? themes,
    CastlesTheme? theme,
  }) {
    return CastlesThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
