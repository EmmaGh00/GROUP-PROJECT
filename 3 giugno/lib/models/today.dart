import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TodayModel extends ChangeNotifier {
  bool _today = false;

  bool get today => _today;
  
  TodayModel() {
    _loadToday();
  }

  Future<void> _loadToday() async {
    final prefs = await SharedPreferences.getInstance();
    _today = prefs.getBool('today') ?? false;
    notifyListeners();
  }

  Future<void> _saveToday() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('today', _today);
  }
 
  void clickToday() {
    _today = true;
    _saveToday();
    notifyListeners();
  }

  void resetToday() {
    _today = false;
    _saveToday();
    notifyListeners();
  }
}