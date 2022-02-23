import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'space_puzzle_event.dart';
part 'space_puzzle_state.dart';

/// {@template space_puzzle_bloc}
/// A bloc responsible for starting the Space puzzle.
/// {@endtemplate}
class SpacePuzzleBloc extends Bloc<SpacePuzzleEvent, SpacePuzzleState> {
  /// {@macro space_puzzle_bloc}
  SpacePuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(SpacePuzzleState(secondsToBegin: secondsToBegin)) {
    on<SpaceCountdownStarted>(_onCountdownStarted);
    on<SpaceCountdownTicked>(_onCountdownTicked);
    on<SpaceCountdownStopped>(_onCountdownStopped);
    on<SpaceCountdownReset>(_onCountdownReset);
  }

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _startTicker() {
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick().listen((_) => add(const SpaceCountdownTicked()));
  }

  void _onCountdownStarted(
    SpaceCountdownStarted event,
    Emitter<SpacePuzzleState> emit,
  ) {
    _startTicker();
    emit(
      state.copyWith(
        isCountdownRunning: true,
        secondsToBegin: secondsToBegin,
      ),
    );
  }

  void _onCountdownTicked(
    SpaceCountdownTicked event,
    Emitter<SpacePuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    SpaceCountdownStopped event,
    Emitter<SpacePuzzleState> emit,
  ) {
    _tickerSubscription?.pause();
    emit(
      state.copyWith(
        isCountdownRunning: false,
        secondsToBegin: secondsToBegin,
      ),
    );
  }

  void _onCountdownReset(
    SpaceCountdownReset event,
    Emitter<SpacePuzzleState> emit,
  ) {
    _startTicker();
    emit(
      state.copyWith(
        isCountdownRunning: true,
        secondsToBegin: event.secondsToBegin ?? secondsToBegin,
      ),
    );
  }
}
