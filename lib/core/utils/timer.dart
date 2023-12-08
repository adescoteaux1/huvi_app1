import 'dart:async';

import 'package:flutter/material.dart';

class TimerSettingDialog extends StatefulWidget {
  
  @override
  _TimerSettingDialogState createState() => _TimerSettingDialogState();
}


class _TimerSettingDialogState extends State<TimerSettingDialog> {
  int _currentTimerValueInSeconds = 0;
  int _timerValueInMinutes = 0;
  int _timerValueInSeconds = 0;
  Timer? _timer;

  int getCurrentTime() {
    return _currentTimerValueInSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Set Timer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Set the timer value in minutes:'),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _timerValueInMinutes = int.tryParse(value) ?? 0;
                _timerValueInSeconds = _timerValueInMinutes * 60;
              });
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Convert the timer value to seconds
            int timerValueInSeconds = _timerValueInMinutes * 60;

            // Perform actions with the timer value (e.g., start the timer)
            // For now, just print the timer value in seconds
            print('Timer set for $timerValueInSeconds seconds');
            _startTimer();
            Navigator.of(context).pop();
            
          },
          
          child: Text('Start'),
        ),
        ElevatedButton(
          onPressed: () {
            // Close the dialog without setting the timer
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  void _startTimer() {
    // Reset the current timer value
    _currentTimerValueInSeconds = _timerValueInSeconds;

    // Create a recurring timer that updates the UI every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_currentTimerValueInSeconds > 0) {
          _currentTimerValueInSeconds--;
        } else {
          // Stop the timer when it reaches zero
          _timer?.cancel();
        }
      });
    });
  }

}
