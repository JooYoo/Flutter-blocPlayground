part of 'counter_bloc.dart';

abstract class CounterState {
  final int val;

  const CounterState(this.val);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class IncrementState extends CounterState {
  final int value;

  IncrementState(this.value) : super(value);
}

class DecrementState extends CounterState {
  final int value;

  DecrementState(this.value) : super(value);
}
