import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:timer_app/components/button_state.dart';

class TimerPageManager {
  final timeNotifier = TimeNotifier();
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.initial);
  final timerTitleNotifier = TimerTitleNotifier();

  void start() {
    if (buttonNotifier.value == ButtonState.initial) {
      buttonNotifier.value = ButtonState.started;
      timeNotifier.startTimer(onDoneCallback: () {
        buttonNotifier.value = ButtonState.finished;
      });
    }
    else if (buttonNotifier.value == ButtonState.paused) {
      buttonNotifier.value = ButtonState.started;
      timeNotifier.unpauseTimer();
    }
  }

  void reset() {
    buttonNotifier.value = ButtonState.initial;
    timeNotifier.resetTimer();
  }

  void pause() {
    buttonNotifier.value = ButtonState.paused;
    timeNotifier.pauseTimer();
  }
}

class TimeNotifier extends ValueNotifier<String> {
  static const int initialValue = 10;
  int time = initialValue;

  Ticker ticker = Ticker();
  StreamSubscription<int>? _tickerSub;

  TimeNotifier() : super(timeToString(initialValue));

  static String timeToString(int inputTime) {
    final seconds = (inputTime % 60).toString().padLeft(2, '0');
    final minutes = ((inputTime / 60) % 60).floor().toString().padLeft(2, '0');
    final hours = (inputTime / 3600).floor().toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  void startTimer({required Function onDoneCallback}) {
    _tickerSub?.cancel();

    _tickerSub = ticker.tick(ticks: time).listen((timerEvent) {
      updateTime(timerEvent);
    });

    _tickerSub?.onDone(() {
      onDoneCallback();
    });
  }

  void pauseTimer() {
    _tickerSub?.pause();
  }

  void resetTimer() {
    _tickerSub?.cancel();
    updateTime(initialValue);
  }

  void unpauseTimer() {
    _tickerSub?.resume();
  }

  void updateTime(int currentTime) {
    value = timeToString(currentTime);
  }

  @override
  void dispose() {
    _tickerSub?.cancel();
    super.dispose();
  }
}

class Ticker {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}

class TimerTitleNotifier extends ValueNotifier<String> {
  TimerTitleNotifier() : super('Medito');

  void setTimerTitle(String inputText) {
    value = inputText;
  }
}
