// ignore_for_file: public_member_api_docs

part of 'castles_theme_bloc.dart';

abstract class CastlesThemeEvent extends Equatable {
  const CastlesThemeEvent();
}

class CastlesThemeChanged extends CastlesThemeEvent {
  const CastlesThemeChanged({required this.themeIndex});

  /// The index of the changed theme in [CastlesThemeState.themes].
  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
