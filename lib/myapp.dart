import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//State is a generic class
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  //protect questions variable from changes
  final _questions = const [
    {
      'questionText': ('What\'s your favorite color?'),
      'answers': [
        {"text": "Black", "score": 1},
        {"text": "red", "score": 2},
        {"text": "green", "score": 3},
        {"text": "white", "score": 4},
        {"text": "blue", "score": 5}
      ]
    },
    {
      'questionText': ('What\'s your favorite animal?'),
      'answers': [
        {"text": "Rabbit", "score": 1},
        {"text": "Snake", "score": 2},
        {"text": "Lion", "score": 3},
        {"text": "Elephant", "score": 4}
      ]
    },
    {
      'questionText': ('What\'s your favorite car?'),
      'answers': [
        {"text": "Honda", "score": 1},
        {"text": "Cadillac", "score": 2},
        {"text": "VW Jetta", "score": 3},
        {"text": "Corrolla", "score": 4}
      ]
    },
  ];

  //will be our callback function; the function (address) we are passing around is also known as a
  //callback function bc the receiving widget calls it in the future
  void _answerQuestion(int num, int score) {
    //bool type; this expression yields true if condition is met

    setState(() {
      _questionIndex = num + 1;
      _totalScore += score;
      print(_totalScore);
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(totalScore: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
