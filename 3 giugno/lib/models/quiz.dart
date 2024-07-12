import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class QuizModel extends ChangeNotifier {
  bool _quiz = false;
  
  bool get quiz => _quiz;
  
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
