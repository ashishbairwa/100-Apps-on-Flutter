import 'package:flutter/material.dart';
const submitRadius = Radius.circular(20);
const activeCard = Color(0xFF1D1E33);
const inactiveCard = Color(0xFF11132B);
const labelTextStyle = TextStyle(fontSize: 15, color: Color(0xFF8D8E98));
const heavyTextStyle = TextStyle(fontSize: 45, fontWeight: FontWeight.w900);

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTitle, style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xFFFF0066),
            borderRadius: BorderRadius.only(
                topLeft: submitRadius, topRight: submitRadius)),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.adjustWeight});
  final IconData icon;
  final Function adjustWeight;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: adjustWeight,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: 50,
          height: 50
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}