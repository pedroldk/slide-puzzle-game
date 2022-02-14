import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'zen_puzzle_event.dart';
part 'zen_puzzle_state.dart';

/// {@template zen_puzzle_bloc}
/// A bloc responsible for starting the Zen puzzle.
/// {@endtemplate}
class ZenPuzzleBloc
    extends Bloc<ZenPuzzleEvent, ZenPuzzleState> {
  /// {@macro zen_puzzle_bloc}
  ZenPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(ZenPuzzleState(secondsToBegin: secondsToBegin)) {
    on<ZenCountdownStarted>(_onCountdownStarted);
    on<ZenCountdownTicked>(_onCountdownTicked);
    on<ZenCountdownStopped>(_onCountdownStopped);
    on<ZenCountdownReset>(_onCountdownReset);
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
        _ticker.tick().listen((_) => add(const ZenCountdownTicked()));
  }

  void _onCountdownStarted(
    ZenCountdownStarted event,
    Emitter<ZenPuzzleState> emit,
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
    ZenCountdownTicked event,
    Emitter<ZenPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    ZenCountdownStopped event,
    Emitter<ZenPuzzleState> emit,
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
    ZenCountdownReset event,
    Emitter<ZenPuzzleState> emit,
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
