import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_playground/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  // Define the init state TODO: maybe it can be set inside timer_state
  static const int _duration = 60;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<_TimerTicked>(_onTicked);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
  }

  /// A lifecycel hook
  /// override the close method on TimerBloc
  /// so that we can cancel the _tickerSubscription when the TimerBloc is closed.
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  /* ---------------------------- Private functions --------------------------- */
  /// When start Timer
  /// - event: TimerStarted
  /// - state: TimeRunInProgress
  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));

    // close the open subscription just in case there is one
    _tickerSubscription?.cancel();
    // listen to the _ticker.tick stream
    // on every tick add a _TimerTicked event with the remaining duration.
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  /// When Timer is running
  /// - event: _TimerTicked
  /// - state: TimerRunInProgress or TimerRunComplete
  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    // The timer is running, check if the duration is greater than 0
    // set the state to TimerRunInProgress
    // otherwise set the state to TimerRunComplete
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : TimerRunComplete(),
    );
  }

  /// When Timer is pause
  /// - event: TimerPaused
  /// - state: TimerRunPause
  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    // Ensure the state is TimerRunInProgress
    // Pause the subscription, stop to get new ticks
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  /// When Timer is resumed from Pause
  /// - event: TimerResumed
  /// - state: TimerRunInProgress
  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    // Ensure the current state is TimerRunPause
    // Resume the subscription, continue to get new ticks
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  /// When Timer is reset
  /// - event: TimerReset
  /// - state: TimerInitial
  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    // No matter what the current state is
    // Cancel the subscription, stop to get any new ticks
    // Push the TimerInitial with original duration
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }
}
