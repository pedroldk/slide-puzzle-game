// ignore_for_file: public_member_api_docs

part of 'animals_puzzle_bloc.dart';

/// The status of [AnimalsPuzzleState].
enum AnimalsPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class AnimalsPuzzleState extends Equatable {
  const AnimalsPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  AnimalsPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? AnimalsPuzzleStatus.loading
      : (secondsToBegin == 0
          ? AnimalsPuzzleStatus.started
          : AnimalsPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  AnimalsPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return AnimalsPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}
