// ignore_for_file: public_member_api_docs

part of 'zen_theme_bloc.dart';

class ZenThemeState extends Equatable {
  const ZenThemeState({
    required this.themes,
    this.theme = const AbstractZenTheme(),
  });

  /// The list of all available [ZenTheme]s.
  final List<ZenTheme> themes;

  /// Currently selected [ZenTheme].
  final ZenTheme theme;

  @override
  List<Object> get props => [themes, theme];

  ZenThemeState copyWith({
    List<ZenTheme>? themes,
    ZenTheme? theme,
  }) {
    return ZenThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}
