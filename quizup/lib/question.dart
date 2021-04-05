import 'package:flutter/material.dart';

class Question {
  List<String> _questions = [];
  List<bool> _answers;
  List<Widget> _scoreKeeper = [];

  int _score = 0;
  int _questionIndex;

  Question() {
    _questions = ['What is my name?',
    'What is your name?',
    'What is your age?'];

    _answers = [true, false, true];
    _questionIndex = 0;
  }

  void increaseCount() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
  }

  void checkAnswer(bool userAnswer) {
    if (_questionIndex < _questions.length) {
      if (_answers[_questionIndex] == userAnswer) {
        _score++;
        _scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
            size: 30.0,
          ),
        );
      } else {
        _scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
            size: 30.0,
          ),
        );
      }
    }
  }

  String getQuestions(int index) {
    return _questions[index];
  }

  int getIndex() {
    return _questionIndex;
  }

  List<Widget> getScoreKeeper() {
    return _scoreKeeper;
  }

  bool isFinished() {
    if (_questionIndex == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuiz() {
    _questionIndex = 0;
  }

  void reset() {
    _questionIndex = 0;
    _scoreKeeper.clear();
    _score = 0;
  }

  int getScore() {
    return _score;
  }

}
