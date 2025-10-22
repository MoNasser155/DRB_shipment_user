import 'dart:async';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int initialTimeInSeconds;
  final VoidCallback onTimerEnd;

  const CountdownTimer({
    super.key,
    this.initialTimeInSeconds = 60,
    required this.onTimerEnd,
  });

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remainingTimeInSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTimeInSeconds = widget.initialTimeInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTimeInSeconds == 0) {
        timer.cancel();
        widget.onTimerEnd();
      } else {
        setState(() {
          _remainingTimeInSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_remainingTimeInSeconds),
      style: AppTextTheme.nonlineText14Primary,
    );
  }
}
