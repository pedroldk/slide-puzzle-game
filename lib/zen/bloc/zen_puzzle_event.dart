// ignore_for_file: public_member_api_docs

part of 'zen_puzzle_bloc.dart';

abstract class ZenPuzzleEvent extends Equatable {
  const ZenPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class ZenCountdownStarted extends ZenPuzzleEvent {
  const ZenCountdownStarted();
}

class ZenCountdownTicked extends ZenPuzzleEvent {
  const ZenCountdownTicked();
}

class ZenCountdownStopped extends ZenPuzzleEvent {
  const ZenCountdownStopped();
}

class ZenCountdownReset extends ZenPuzzleEvent {
  const ZenCountdownReset({this.secondsToBegin});

  /// The number of seconds to countdown from.
  /// Defaults to [ZenPuzzleBloc.secondsToBegin] if null.
  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}
