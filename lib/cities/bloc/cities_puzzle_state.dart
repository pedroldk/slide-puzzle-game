// ignore_for_file: public_member_api_docs

part of 'cities_puzzle_bloc.dart';

/// The status of [CitiesPuzzleState].
enum CitiesPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class CitiesPuzzleState extends Equatable {
  const CitiesPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  CitiesPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? CitiesPuzzleStatus.loading
      : (secondsToBegin == 0
          ? CitiesPuzzleStatus.started
          : CitiesPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  CitiesPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return CitiesPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}
