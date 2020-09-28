import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int tScore;
  final Function resetHandler;
  Result({this.tScore, this.resetHandler});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          "Your Total Score ",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        )),
        Padding(padding: EdgeInsets.all(10)),
        Center(
            child: Text(
          tScore.toString(),
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
        )),
        RaisedButton(onPressed: resetHandler, child: Text("Restart Quiz"))
      ],
    );
  }
}
