import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int idx, qindex;
  final Function answerAction;
  Quiz(
      {@required this.questions,
      @required this.idx,
      @required this.qindex,
      @required this.answerAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[idx]['questionText'], qindex),
        ...(questions[idx]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answers(answer['text'], () => answerAction(answer['score']));
        }).toList(),
      ],
    );
  }
}
