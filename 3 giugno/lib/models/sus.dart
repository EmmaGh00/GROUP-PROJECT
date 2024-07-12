import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SusModel extends ChangeNotifier {
  int _sus = 0;

  int get sus => _sus;

  SusModel() {
    _loadSus();
  }

  Future<void> _loadSus() async {
    final prefs = await SharedPreferences.getInstance();
    _sus = prefs.getInt('sus') ?? 0;
    notifyListeners();
  }

  Future<void> _saveSus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sus', _sus);
  }

  void incrementSus() {
    _sus++;
    _saveSus();
    notifyListeners();
  }
}