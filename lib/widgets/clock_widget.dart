import 'dart:async';

import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    updateTime();
    // Update the time every second
    Timer.periodic(Duration(seconds: 30), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    setState(() {
      currentTime = _getCurrentTime();
    });
  }

  String _getCurrentTime() {
  DateTime now = DateTime.now();
  String period = now.hour < 12 ? 'AM' : 'PM';
  int hourIn12HourFormat = now.hour > 12 ? now.hour - 12 : now.hour;
  hourIn12HourFormat = hourIn12HourFormat == 0 ? 12 : hourIn12HourFormat;
  return '$hourIn12HourFormat:${_twoDigits(now.minute)} $period';
}

String _twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
      '$currentTime',
      style: TextStyle(fontSize: 24),
    ),
    );
  }
}
