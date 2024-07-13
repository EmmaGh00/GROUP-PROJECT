import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScoreModel extends ChangeNotifier {
  int _score = 170;

  int get score => _score;

  ScoreModel() {
    _loadScore();
  }

  Future<void> _loadScore() async {
    final prefs = await SharedPreferences.getInstance();
    _score = prefs.getInt('score') ?? 170;
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

  void decrementScore() {
    _score--;
    _saveScore();
    notifyListeners();
  }

  void increment5Score() {
    _score +=5;
    _saveScore();
    notifyListeners();
  }

  void increment10Score() {
    _score +=10;
    _saveScore();
    notifyListeners();
  }

  void decrement5Score() {
    _score -=5;
    _saveScore();
    notifyListeners();
  }

  void decrement10Score() {
    _score -=10;
    _saveScore();
    notifyListeners();
  }

  void decrement150Score() {
    _score -=150;
    _saveScore();
    notifyListeners();
  }

  void decrement200Score() {
    _score -=200;
    _saveScore();
    notifyListeners();
  }

  void decrement250Score() {
    _score -=250;
    _saveScore();
    notifyListeners();
  }

  void decrement300Score() {
    _score -=300;
    _saveScore();
    notifyListeners();
  }

  void resetScore() {
    _score = 170;
    _saveScore();
    notifyListeners();
  }

  void delateScore() {
    _score = 0;
    _saveScore();
    notifyListeners();
  }
  
}