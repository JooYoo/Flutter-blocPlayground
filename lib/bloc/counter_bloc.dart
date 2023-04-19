import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementPressed>(
        (event, emit) => emit(IncrementState(state.val + 1)));
    on<CounterDecrementPressed>(
        (event, emit) => emit(DecrementState(state.val - 1)));
  }
}
