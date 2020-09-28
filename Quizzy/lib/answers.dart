import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answerText;
  final Function selectHandler;
  Answers(this.answerText, this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(answerText),
        //we have to couple it later
        onPressed: selectHandler,
        color: Colors.redAccent,
        textColor: Colors.white,
      ),
    );
  }
}
