import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  DashCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius:
            10.0, // has the effect of softening the shadow
          )
        ],
      ),
      margin: EdgeInsets.all(15.0),
    );
  }
}