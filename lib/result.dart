import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result({this.totalScore, this.resetQuiz});

  String get resultPhrase {
    var phrasePositive = 'You did it! All correct\n';
    var phraseNegative = "Try again...\n";
    var phraseAmbigous = "Wow... Missed one\n";
    if (totalScore <= 5) {
      return phraseNegative + totalScore.toString() + ' points';
    } else if (totalScore == 10) {
      return phraseAmbigous + totalScore.toString() + ' points';
    } else {
      return phrasePositive + totalScore.toString() + ' points';
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
