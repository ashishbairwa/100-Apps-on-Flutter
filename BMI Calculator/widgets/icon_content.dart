import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({this.icon,this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80,),
        SizedBox(height: 15,),
        Text(label, style: TextStyle(fontSize: 15, color: Color(0xFF8D8E98)),)
      ],
    );
  }
}