// ignore_for_file: public_member_api_docs

part of 'castles_puzzle_bloc.dart';

abstract class CastlesPuzzleEvent extends Equatable {
  const CastlesPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class CastlesCountdownStarted extends CastlesPuzzleEvent {
  const CastlesCountdownStarted();
}

class CastlesCountdownTicked extends CastlesPuzzleEvent {
  const CastlesCountdownTicked();
}

class CastlesCountdownStopped extends CastlesPuzzleEvent {
  const CastlesCountdownStopped();
}

class CastlesCountdownReset extends CastlesPuzzleEvent {
  const CastlesCountdownReset({this.secondsToBegin});

  /// The number of seconds to countdown from.
  /// Defaults to [CastlesPuzzleBloc.secondsToBegin] if null.
  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}
