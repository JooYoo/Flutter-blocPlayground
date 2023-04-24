import 'package:bloc_playground/timer/view/timer_page.dart';
import 'package:flutter/material.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Timer',
      home: TimerPage(),
    );
  }
}
