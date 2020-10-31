import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//State is a generic class
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

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
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: () => _answerQuestion(0),
            ),
            RaisedButton(
              child: Text('Answer2'),
              onPressed: () => _answerQuestion(1),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                _answerQuestion(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
