// ignore_for_file: public_member_api_docs

part of 'animals_theme_bloc.dart';

abstract class AnimalsThemeEvent extends Equatable {
  const AnimalsThemeEvent();
}

class AnimalsThemeChanged extends AnimalsThemeEvent {
  const AnimalsThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [AnimalsThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
