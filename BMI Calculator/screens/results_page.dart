import 'package:flutter/material.dart';
import '../widgets/reusable_card.dart';
import '../widgets/custom_buttons.dart';

const activeCard = Color(0xFF1D1E33);
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold
);

const BMITextStyle = TextStyle(
fontSize: 80.0,
fontWeight: FontWeight.bold
);

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result',),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: DashCard(
              colour: activeCard,
              cardChild: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  SizedBox(height: 150,),
                  Text(resultText.toUpperCase(), style: resultTextStyle,),
                  SizedBox(height: 20,),
                  Text(bmiResult, style: BMITextStyle,),
                  SizedBox(height: 20,),
                  Text(interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16
                      ),)
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
