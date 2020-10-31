import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//State is a generic class
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  //will be our callback function; the function (address) we are passing around is also known as a
  //callback function bc the receiving widget calls it in the future
  void _answerQuestion(int num) {
    setState(() {
      _questionIndex = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      ('What\'s your favorite color?'),
      ('What\'s your favorite animal?'),
      ('What\'s your favorite car?'),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questionText: questions[_questionIndex]),
            Answer(selectHandler: () => _answerQuestion(0), text: "Answer 1"),
            Answer(selectHandler: () => _answerQuestion(1), text: "Answer 2"),
            Answer(selectHandler: () => _answerQuestion(2), text: "Answer 3"),
          ],
        ),
      ),
    );
  }
}
