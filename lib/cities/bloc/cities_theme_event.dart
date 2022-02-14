// ignore_for_file: public_member_api_docs

part of 'cities_theme_bloc.dart';

abstract class CitiesThemeEvent extends Equatable {
  const CitiesThemeEvent();
}

class CitiesThemeChanged extends CitiesThemeEvent {
  const CitiesThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [CitiesThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
