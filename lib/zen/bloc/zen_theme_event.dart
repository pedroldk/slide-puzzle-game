// ignore_for_file: public_member_api_docs

part of 'zen_theme_bloc.dart';

abstract class ZenThemeEvent extends Equatable {
  const ZenThemeEvent();
}

class ZenThemeChanged extends ZenThemeEvent {
  const ZenThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [ZenThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
