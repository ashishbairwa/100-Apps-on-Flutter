import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';
import '../widgets/custom_buttons.dart';
import 'package:bmi_calculator/calculator_brain.dart';

const submitRadius = Radius.circular(20);
const activeCard = Color(0xFF1D1E33);
const inactiveCard = Color(0xFF11132B);
const labelTextStyle = TextStyle(fontSize: 15, color: Color(0xFF8D8E98));
const heavyTextStyle = TextStyle(fontSize: 45, fontWeight: FontWeight.w900);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCard = inactiveCard;
  Color femaleCard = inactiveCard;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCard = activeCard;
                        femaleCard = inactiveCard;
                      });
                    },
                    child: DashCard(
                      colour: maleCard,
                      cardChild: CustomIcon(
                        label: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        femaleCard = activeCard;
                        maleCard = inactiveCard;
                      });
                    },
                    child: DashCard(
                      colour: femaleCard,
                      cardChild: CustomIcon(
                        label: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            //slider card config
            child: DashCard(
              colour: activeCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: heavyTextStyle,
                      ),
                      Text('cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),

            ),
          ),
          Expanded(
            //last row having weight menus
            child: Row(
              children: <Widget>[
                Expanded(
                  //card no 1 having the weight menu
                  child: DashCard(
                      colour: activeCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: heavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,adjustWeight: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                              SizedBox(width: 8,),
                              RoundIconButton(icon: FontAwesomeIcons.plus, adjustWeight: (){
                                setState(() {
                                  weight++;
                                });
                              },)
                            ],
                          )
                        ],
                      ),
                  ),
                ),
                Expanded(
                  //card no 1 having the weight menu
                  child: DashCard(
                    colour: activeCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: heavyTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,adjustWeight: (){
                              setState(() {
                                age--;
                              });
                            },),
                            SizedBox(width: 8,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, adjustWeight: (){
                              setState(() {
                                age++;
                              });
                            },)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));

            },
              buttonTitle: 'CALCULATE',),
        ],
      ),
    );
  }
}



