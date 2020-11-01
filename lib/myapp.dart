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

  var questions = [
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
    setState(() {
      if (_questionIndex + 1 < questions.length) {
        _questionIndex = num + 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questionText: questions[_questionIndex]["questionText"]),
            //spread operator pulls items in a list out of the list
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(
                  selectHandler: () => _answerQuestion(_questionIndex),
                  text: answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
