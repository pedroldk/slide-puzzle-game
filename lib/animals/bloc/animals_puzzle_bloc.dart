import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'animals_puzzle_event.dart';
part 'animals_puzzle_state.dart';

/// {@template animals_puzzle_bloc}
/// A bloc responsible for starting the Animals puzzle.
/// {@endtemplate}
class AnimalsPuzzleBloc
    extends Bloc<AnimalsPuzzleEvent, AnimalsPuzzleState> {
  /// {@macro animals_puzzle_bloc}
  AnimalsPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(AnimalsPuzzleState(secondsToBegin: secondsToBegin)) {
    on<AnimalsCountdownStarted>(_onCountdownStarted);
    on<AnimalsCountdownTicked>(_onCountdownTicked);
    on<AnimalsCountdownStopped>(_onCountdownStopped);
    on<AnimalsCountdownReset>(_onCountdownReset);
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
        _ticker.tick().listen((_) => add(const AnimalsCountdownTicked()));
  }

  void _onCountdownStarted(
    AnimalsCountdownStarted event,
    Emitter<AnimalsPuzzleState> emit,
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
    AnimalsCountdownTicked event,
    Emitter<AnimalsPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    AnimalsCountdownStopped event,
    Emitter<AnimalsPuzzleState> emit,
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
    AnimalsCountdownReset event,
    Emitter<AnimalsPuzzleState> emit,
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
