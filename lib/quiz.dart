import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final bool answeredCorrectly;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion,
      @required this.answeredCorrectly});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questionText: widget.questions[widget.questionIndex]
                ["questionText"]),
        //spread operator pulls items in a list out of the list
        ...(widget.questions[widget.questionIndex]["answers"]
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              // selectHandler:
              selectHandler: widget.answeredCorrectly
                  ? null
                  : () => widget.answerQuestion(widget.questionIndex,
                      answer["score"], answer["isCorrect"]),
              text: answer["text"]);
        }).toList(),
      ],
    );
  }
}
