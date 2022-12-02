import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'question.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Greeen', 'score': 3},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Red', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Fox', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Asif', 'score': 5},
        {'text': 'Afzal', 'score': 3},
        {'text': 'Rivan', 'score': 4},
        {'text': 'Aman', 'score': 2},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print("No more Questions");
    }
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Quiz App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestions: _answerQuestion,
                  questionIndex: _questionIndex,
                )
              : Result(resetQuiz, _totalScore)),
    );
  }
}
