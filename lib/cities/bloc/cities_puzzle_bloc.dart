import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'cities_puzzle_event.dart';
part 'cities_puzzle_state.dart';

/// {@template cities_puzzle_bloc}
/// A bloc responsible for starting the Cities puzzle.
/// {@endtemplate}
class CitiesPuzzleBloc
    extends Bloc<CitiesPuzzleEvent, CitiesPuzzleState> {
  /// {@macro cities_puzzle_bloc}
  CitiesPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(CitiesPuzzleState(secondsToBegin: secondsToBegin)) {
    on<CitiesCountdownStarted>(_onCountdownStarted);
    on<CitiesCountdownTicked>(_onCountdownTicked);
    on<CitiesCountdownStopped>(_onCountdownStopped);
    on<CitiesCountdownReset>(_onCountdownReset);
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
        _ticker.tick().listen((_) => add(const CitiesCountdownTicked()));
  }

  void _onCountdownStarted(
    CitiesCountdownStarted event,
    Emitter<CitiesPuzzleState> emit,
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
    CitiesCountdownTicked event,
    Emitter<CitiesPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    CitiesCountdownStopped event,
    Emitter<CitiesPuzzleState> emit,
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
    CitiesCountdownReset event,
    Emitter<CitiesPuzzleState> emit,
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
