import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int remainingTimeInSeconds;

  TimerDisplay({required this.remainingTimeInSeconds});

  @override
  Widget build(BuildContext context) {
    // Format the remaining time as minutes:seconds
    String minutes = (remainingTimeInSeconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (remainingTimeInSeconds % 60).toString().padLeft(2, '0');

    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 24),
    );
  }
}