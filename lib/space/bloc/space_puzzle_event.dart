// ignore_for_file: public_member_api_docs

part of 'space_puzzle_bloc.dart';

abstract class SpacePuzzleEvent extends Equatable {
  const SpacePuzzleEvent();

  @override
  List<Object?> get props => [];
}

class SpaceCountdownStarted extends SpacePuzzleEvent {
  const SpaceCountdownStarted();
}

class SpaceCountdownTicked extends SpacePuzzleEvent {
  const SpaceCountdownTicked();
}

class SpaceCountdownStopped extends SpacePuzzleEvent {
  const SpaceCountdownStopped();
}

class SpaceCountdownReset extends SpacePuzzleEvent {
  const SpaceCountdownReset({this.secondsToBegin});

  /// The number of seconds to countdown from.
  /// Defaults to [SpacePuzzleBloc.secondsToBegin] if null.
  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}
