import 'package:bloc_playground/ticker.dart';
import 'package:bloc_playground/timer/bloc/timer_bloc.dart';
import 'package:bloc_playground/timer/view/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  /// BlocProvider:
  /// - Dependency Injection
  /// - Provide the TimerBloc to the child widget
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}
