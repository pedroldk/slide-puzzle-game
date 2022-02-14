// ignore_for_file: public_member_api_docs

part of 'dinosaurs_theme_bloc.dart';

abstract class DinosaursThemeEvent extends Equatable {
  const DinosaursThemeEvent();
}

class DinosaursThemeChanged extends DinosaursThemeEvent {
  const DinosaursThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [DinosaursThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
