import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_slide_puzzle/models/models.dart';

part 'castles_puzzle_event.dart';
part 'castles_puzzle_state.dart';

/// {@template castles_puzzle_bloc}
/// A bloc responsible for starting the Castles puzzle.
/// {@endtemplate}
class CastlesPuzzleBloc
    extends Bloc<CastlesPuzzleEvent, CastlesPuzzleState> {
  /// {@macro castles_puzzle_bloc}
  CastlesPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(CastlesPuzzleState(secondsToBegin: secondsToBegin)) {
    on<CastlesCountdownStarted>(_onCountdownStarted);
    on<CastlesCountdownTicked>(_onCountdownTicked);
    on<CastlesCountdownStopped>(_onCountdownStopped);
    on<CastlesCountdownReset>(_onCountdownReset);
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
        _ticker.tick().listen((_) => add(const CastlesCountdownTicked()));
  }

  void _onCountdownStarted(
    CastlesCountdownStarted event,
    Emitter<CastlesPuzzleState> emit,
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
    CastlesCountdownTicked event,
    Emitter<CastlesPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    CastlesCountdownStopped event,
    Emitter<CastlesPuzzleState> emit,
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
    CastlesCountdownReset event,
    Emitter<CastlesPuzzleState> emit,
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
