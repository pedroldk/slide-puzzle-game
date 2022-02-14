// ignore_for_file: public_member_api_docs

part of 'dinosaurs_puzzle_bloc.dart';

abstract class DinosaursPuzzleEvent extends Equatable {
  const DinosaursPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class DinosaursCountdownStarted extends DinosaursPuzzleEvent {
  const DinosaursCountdownStarted();
}

class DinosaursCountdownTicked extends DinosaursPuzzleEvent {
  const DinosaursCountdownTicked();
}

class DinosaursCountdownStopped extends DinosaursPuzzleEvent {
  const DinosaursCountdownStopped();
}

class DinosaursCountdownReset extends DinosaursPuzzleEvent {
  const DinosaursCountdownReset({this.secondsToBegin});

  /// The number of seconds to countdown from.
  /// Defaults to [DinosaursPuzzleBloc.secondsToBegin] if null.
  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}
