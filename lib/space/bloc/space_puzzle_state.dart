// ignore_for_file: public_member_api_docs

part of 'space_puzzle_bloc.dart';

/// The status of [SpacePuzzleState].
enum SpacePuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class SpacePuzzleState extends Equatable {
  const SpacePuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  SpacePuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? SpacePuzzleStatus.loading
      : (secondsToBegin == 0
          ? SpacePuzzleStatus.started
          : SpacePuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  SpacePuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return SpacePuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}
