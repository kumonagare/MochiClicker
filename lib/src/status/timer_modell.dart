import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerModel extends ChangeNotifier {
  int _counter = 0;

  TimerModel() {
    loadCounter();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _incrementCounter();
    });
  }

  String get counterDisplay {
    Duration duration = Duration(seconds: _counter);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours.remainder(60));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  void _incrementCounter() {
    _counter++;
    saveCounter();
    notifyListeners();
  }

  Future<void> loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  Future<void> saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
  }
}
