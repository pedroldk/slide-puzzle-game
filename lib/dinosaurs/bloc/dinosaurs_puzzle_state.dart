// ignore_for_file: public_member_api_docs

part of 'dinosaurs_puzzle_bloc.dart';

/// The status of [DinosaursPuzzleState].
enum DinosaursPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class DinosaursPuzzleState extends Equatable {
  const DinosaursPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  DinosaursPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? DinosaursPuzzleStatus.loading
      : (secondsToBegin == 0
          ? DinosaursPuzzleStatus.started
          : DinosaursPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  DinosaursPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return DinosaursPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}
