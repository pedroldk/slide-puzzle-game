// ignore_for_file: public_member_api_docs

part of 'animals_puzzle_bloc.dart';

abstract class AnimalsPuzzleEvent extends Equatable {
  const AnimalsPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class AnimalsCountdownStarted extends AnimalsPuzzleEvent {
  const AnimalsCountdownStarted();
}

class AnimalsCountdownTicked extends AnimalsPuzzleEvent {
  const AnimalsCountdownTicked();
}

class AnimalsCountdownStopped extends AnimalsPuzzleEvent {
  const AnimalsCountdownStopped();
}

class AnimalsCountdownReset extends AnimalsPuzzleEvent {
  const AnimalsCountdownReset({this.secondsToBegin});

  /// The number of seconds to countdown from.
  /// Defaults to [AnimalsPuzzleBloc.secondsToBegin] if null.
  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}
