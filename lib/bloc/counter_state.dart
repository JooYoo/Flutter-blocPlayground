part of 'counter_bloc.dart';

abstract class CounterState {
  final int val;

  const CounterState(this.val);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class IncrementState extends CounterState {
  IncrementState(super.val);
}

class DecrementState extends CounterState {
  DecrementState(super.val);
}
