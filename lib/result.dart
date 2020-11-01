import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result({this.totalScore, this.resetQuiz});

  String get resultPhrase {
    var phrasePositive = 'You did it! ';
    var phraseNegative = "Try again...";
    var phraseAmbigous = "Wow... ";
    if (totalScore < 5) {
      return phraseNegative + totalScore.toString();
    } else if (totalScore < 10) {
      return phraseAmbigous + totalScore.toString();
    } else {
      return phrasePositive + totalScore.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed: () {
            resetQuiz();
          },
          child: Text("Restart"),
          textColor: Colors.lightBlue,
        ),
      ],
    ));
  }
}
