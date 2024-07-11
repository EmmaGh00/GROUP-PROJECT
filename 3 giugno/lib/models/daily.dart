import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class QuizModel extends ChangeNotifier {
  bool _quiz = false;
  bool _today = false;

  bool get quiz => _quiz;
  bool get today => _today;
  
  // QUIZ
  QuizModel() {
    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    _quiz = prefs.getBool('quiz') ?? false;
    notifyListeners();
  }

  Future<void> _saveQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('quiz', _quiz);
  }
 
  void clickQuiz() {
    _quiz = true;
    _saveQuiz();
    notifyListeners();
  }

  void resetQuiz() {
    _quiz = false;
    _saveQuiz();
    notifyListeners();
  }
}

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