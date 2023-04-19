import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementPressed>((event, emit) {
      int val = state.val + 1;
      emit(IncrementState(val));
    });

    on<CounterDecrementPressed>((event, emit) {
      int val = state.val - 1;
      emit(DecrementState(val));
    });
  }
}
