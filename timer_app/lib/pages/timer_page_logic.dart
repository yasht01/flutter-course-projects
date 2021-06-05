import 'package:flutter/foundation.dart';

import 'package:timer_app/components/button_state.dart';

class TimerPageManager {
  final timeNotifier = TimeNotifier();
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);
}

class TimeNotifier extends ValueNotifier<String> {

  static const int initialValue = 10;
  int time = initialValue;

  TimeNotifier() : super('00:00:10');

  String timeToString(int inputTime) {
    final seconds = (inputTime % 60).toString().padLeft(2, '0');
    final minutes = (inputTime / 60).floor().toString().padLeft(2, '0');
    final hours = (inputTime / 3600).floor().toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }
}