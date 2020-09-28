import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int idx = 0;
  var qindex = 1;
  int totalQues = 0;
  int totalScore = 0;

  void answerAction(int score) {
    totalScore += score;
    setState(() {
      idx += 1;
      qindex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      totalScore = 0;
      idx = 0;
      qindex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 3},
          {'text': 'Snake', 'score': 11},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 9},
        ],
      },
      {
        'questionText': 'Who\'s your favorite fictional character?',
        'answers': [
          {'text': 'Captain America', 'score': 1},
          {'text': 'Iron Man', 'score': 1},
          {'text': 'Hulk', 'score': 1},
          {'text': 'Spider Man', 'score': 1},
        ],
      },
    ];

    totalQues = questions.length;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: idx < totalQues
            ? Quiz(
                answerAction: answerAction,
                idx: idx,
                qindex: qindex,
                questions: questions,
              )
            : Result(tScore: totalScore, resetHandler: resetQuiz),
      ),
    );
  }
}
