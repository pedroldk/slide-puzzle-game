// ignore_for_file: public_member_api_docs

part of 'castles_puzzle_bloc.dart';

/// The status of [CastlesPuzzleState].
enum CastlesPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class CastlesPuzzleState extends Equatable {
  const CastlesPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  CastlesPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? CastlesPuzzleStatus.loading
      : (secondsToBegin == 0
          ? CastlesPuzzleStatus.started
          : CastlesPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  CastlesPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return CastlesPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}
