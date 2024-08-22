import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz_master/models/questionmodel.dart';

class QuizProvider extends ChangeNotifier {
  List<QuizQuestion> _questions = []; 
  int _score = 0; 
  int _currentIndex = 0; 

  
  List<QuizQuestion> get questions => _questions;
  int get score => _score;
  int get currentIndex => _currentIndex;

  
  void setRandomQuestions() {
    final random = Random();
    _questions = List<QuizQuestion>.from(quizQuestions)
      ..shuffle(random); 
    _questions = _questions.take(25).toList(); 
    notifyListeners();
  }

  
  void updateScore(int points) {
    _score += points;
    notifyListeners();
  }

  
  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  
  void resetQuiz() {
    _score = 0;
    _currentIndex = 0;
    notifyListeners();
  }
}
