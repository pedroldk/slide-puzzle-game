// ignore_for_file: public_member_api_docs

part of 'zen_puzzle_bloc.dart';

/// The status of [ZenPuzzleState].
enum ZenPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class ZenPuzzleState extends Equatable {
  const ZenPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  ZenPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? ZenPuzzleStatus.loading
      : (secondsToBegin == 0
          ? ZenPuzzleStatus.started
          : ZenPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  ZenPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return ZenPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}
