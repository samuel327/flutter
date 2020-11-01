import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import './constants/constants.dart' as Constants;

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
  final _questions = Constants.questions;

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
          title: Text('History Trivia'),
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
