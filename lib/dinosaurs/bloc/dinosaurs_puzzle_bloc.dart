import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'dinosaurs_puzzle_event.dart';
part 'dinosaurs_puzzle_state.dart';

/// {@template dinosaurs_puzzle_bloc}
/// A bloc responsible for starting the Dinosaurs puzzle.
/// {@endtemplate}
class DinosaursPuzzleBloc
    extends Bloc<DinosaursPuzzleEvent, DinosaursPuzzleState> {
  /// {@macro dinosaurs_puzzle_bloc}
  DinosaursPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(DinosaursPuzzleState(secondsToBegin: secondsToBegin)) {
    on<DinosaursCountdownStarted>(_onCountdownStarted);
    on<DinosaursCountdownTicked>(_onCountdownTicked);
    on<DinosaursCountdownStopped>(_onCountdownStopped);
    on<DinosaursCountdownReset>(_onCountdownReset);
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
        _ticker.tick().listen((_) => add(const DinosaursCountdownTicked()));
  }

  void _onCountdownStarted(
    DinosaursCountdownStarted event,
    Emitter<DinosaursPuzzleState> emit,
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
    DinosaursCountdownTicked event,
    Emitter<DinosaursPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    DinosaursCountdownStopped event,
    Emitter<DinosaursPuzzleState> emit,
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
    DinosaursCountdownReset event,
    Emitter<DinosaursPuzzleState> emit,
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
