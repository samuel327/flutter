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

  //protect questions variable from changes
  final _questions = const [
    {
      'questionText': ('What\'s your favorite color?'),
      'answers': ["Black", "red", "green", "white", "blue"]
    },
    {
      'questionText': ('What\'s your favorite animal?'),
      'answers': ["Rabbit", "Snake", "Lion", "Elephant"]
    },
    {
      'questionText': ('What\'s your favorite car?'),
      'answers': ["Honda", "Cadillac", "VW Jetta", "Corrolla"]
    },
  ];

  //will be our callback function; the function (address) we are passing around is also known as a
  //callback function bc the receiving widget calls it in the future
  void _answerQuestion(int num) {
    //bool type; this expression yields true if condition is met

    setState(() {
      _questionIndex = num + 1;
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
            : Result(),
      ),
    );
  }
}
