import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String text;
  Answer({this.selectHandler, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: RaisedButton(
        child: Text(text),
        textColor: Colors.white,
        onPressed: selectHandler,
        color: Colors.blue,
      ),
    );
  }
}
