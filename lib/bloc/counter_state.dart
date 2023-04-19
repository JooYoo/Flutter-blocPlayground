part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class IncrementState extends CounterState {
  final int value;

  IncrementState(this.value);
}

class DecrementState extends CounterState {
  final int value;

  DecrementState(this.value);
}
