import 'dart:ui';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/custom_floating_action_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_data.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderType {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  GenderType selectGender;
  int height = 50;
  int weight = 5;
  int age = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      changeActive: () {
                        setState(() {
                          selectGender = GenderType.male;
                        });
                      },
                      colour: selectGender == GenderType.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    changeActive: () {
                      setState(() {
                        selectGender = GenderType.female;
                      });
                    },
                    colour: selectGender == GenderType.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconContent(
                      iconText: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbersTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x30EB1555),
                        thumbColor: kBottomContainerColor,
                        trackHeight: 0.5,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 5.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 17.0,
                        )),
                    child: Slider(
                        inactiveColor: Color(0xFF8D8E98),
                        value: height.toDouble(),
                        min: 50.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumbersTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomFAB(
                              customIcon: FontAwesomeIcons.minus,
                              onFabPressed: () {
                                setState(() {
                                  {
                                    if (CustomFAB().onFabPressed != null) {
                                      weight--;
                                    }
                                  }

                                  if (weight <= 5) {
                                    weight = 5;
                                  }
                                });
                              },
                            ),
                            CustomFAB(
                              customIcon: FontAwesomeIcons.plus,
                              onFabPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomFAB(
                              customIcon: FontAwesomeIcons.minus,
                              onFabPressed: () {
                                setState(() {
                                  age--;
                                  if (age <= 1) {
                                    age = 5;
                                  }
                                });
                              },
                            ),
                            CustomFAB(
                              customIcon: FontAwesomeIcons.plus,
                              onFabPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calcBrain =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calcBrain.calculateBMI(),
                    resultText: calcBrain.getResult(),
                    interpretation: calcBrain.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              decoration: kBottomContainerStyle,
              height: kBottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: Center(
                child: Text("Calculate", style: kBottomContainerTextStyle),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: kInactiveColor),
                margin: EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/photo.jpg'),
                        radius: 40.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hello Sirojiddin!',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.home),
                tileColor: kActiveColor,
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                tileColor: kActiveColor,
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.share),
                tileColor: kActiveColor,
                title: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                leading: Icon(Icons.info),
                tileColor: kActiveColor,
                title: Text(
                  "About",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
