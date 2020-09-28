import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String questionText;
  var index = 0;
  Question(this.questionText, this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('Question Number ' + index.toString()),
            subtitle: Text(
              questionText,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
