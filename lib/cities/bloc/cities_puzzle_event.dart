// ignore_for_file: public_member_api_docs

part of 'cities_puzzle_bloc.dart';

abstract class CitiesPuzzleEvent extends Equatable {
  const CitiesPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class CitiesCountdownStarted extends CitiesPuzzleEvent {
  const CitiesCountdownStarted();
}

class CitiesCountdownTicked extends CitiesPuzzleEvent {
  const CitiesCountdownTicked();
}

class CitiesCountdownStopped extends CitiesPuzzleEvent {
  const CitiesCountdownStopped();
}

class CitiesCountdownReset extends CitiesPuzzleEvent {
  const CitiesCountdownReset({this.secondsToBegin});

  /// The number of seconds to countdown from.
  /// Defaults to [CitiesPuzzleBloc.secondsToBegin] if null.
  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}
