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
  var _hasAnswered = false;
  var _correct = false;
  //protect questions variable from changes
  final _questions = Constants.questions;

  //will be our callback function; the function (address) we are passing around is also known as a
  //callback function bc the receiving widget calls it in the future
  void _answerQuestion(int num, int score, bool isCorrect) {
    //bool type; this expression yields true if condition is met

    setState(() {
      _hasAnswered = true;
      _correct = isCorrect;
      _totalScore += score;
      print(_totalScore);
    });
    print("Chosen answer was " + _correct.toString());
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _nextQuestion(int num) {
    setState(() {
      _questionIndex = num + 1;
      _correct = false;
      _hasAnswered = false;
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
            ? Column(
                children: [
                  Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    questionIndex: _questionIndex,
                    answeredCorrectly: _correct,
                  ),
                  _correct && _hasAnswered
                      ? Text("True")
                      : _hasAnswered
                          ? Text('false')
                          : Text(''),
                  RaisedButton(
                      child: Text("Next"),
                      textColor: Colors.blue,
                      onPressed: () => _nextQuestion(_questionIndex))
                ],
              )
            : Result(totalScore: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
