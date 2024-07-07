import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScoreModel extends ChangeNotifier {
  int _score = 0;

  int get score => _score;

  ScoreModel() {
    _loadScore();
  }

  Future<void> _loadScore() async {
    final prefs = await SharedPreferences.getInstance();
    _score = prefs.getInt('score') ?? 0;
    notifyListeners();
  }

  Future<void> _saveScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', _score);
  }

  void incrementScore() {
    _score++;
    _saveScore();
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    _saveScore();
    notifyListeners();
  }
  
}