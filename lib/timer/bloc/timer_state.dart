part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  // Equatable
  @override
  List<Object> get props => [duration];
}

/* ------ There are multiple events are available to each of the state. ----- */

// TODO: update the state classes, should related with state
/// - start
class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

/// - pause
/// - reset
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

/// - resume
/// - reset
class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

/// - rest
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
