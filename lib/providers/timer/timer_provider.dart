import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_is_my_car/providers/timer/timer_state.dart';

class TimerProvider with ChangeNotifier {
  SharedPreferences? prefs;
  late Timer _timer;
  TimerState _state = TimerState.initial();
  TimerState get state => _state;

  void initTimer() async {
    prefs = await SharedPreferences.getInstance();
    final int? regTime = prefs!.getInt('regTime');
    if (regTime != null) {
      int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      int seconds = currentTime - regTime;
      int minutes = (seconds / 60).floor();
      int hours = (minutes / 60).floor();
      int days = (hours / 24).floor();

      hours %= 24;
      minutes %= 60;
      seconds %= 60;

      _state = _state.copyWith(
        seconds: seconds,
        minutes: minutes,
        hours: hours,
        days: days,
      );
      notifyListeners();
    }
    startTimer();
  }

  void startTimer() {
    bool timerUpdated = false;
    int tempSecond = _state.seconds;
    int tempMinute = _state.minutes;
    int tempHour = _state.hours;
    int tempDay = _state.days;

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      tempSecond++;
      if (tempSecond == 60) {
        tempSecond = 0;
        tempMinute++;
        timerUpdated = true;
      }
      if (tempMinute == 60) {
        tempMinute = 0;
        tempHour++;
      }
      if (tempHour == 24) {
        tempHour = 0;
        tempDay++;
      }
      if (timerUpdated) {
        _state = _state.copyWith(
          days: tempDay,
          hours: tempHour,
          minutes: tempMinute,
          seconds: tempSecond,
        );
        notifyListeners();
        timerUpdated = false;
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    _state = _state.copyWith(
      days: 0,
      hours: 0,
      minutes: 0,
      seconds: 0,
    );
    prefs!.setInt('regTime', DateTime.now().millisecondsSinceEpoch ~/ 1000);
    startTimer();
    notifyListeners();
  }

  void stopTimer() {
    _timer.cancel();
    notifyListeners();
  }
}
