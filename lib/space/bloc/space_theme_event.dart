// ignore_for_file: public_member_api_docs

part of 'space_theme_bloc.dart';

abstract class SpaceThemeEvent extends Equatable {
  const SpaceThemeEvent();
}

class SpaceThemeChanged extends SpaceThemeEvent {
  const SpaceThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [SpaceThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
