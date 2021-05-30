import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    this.resultText,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    this.bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Normal BMI range:',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        '18,5 - 25 kg/m2',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Alert(
                              title: 'Advices',
                              desc: this.interpretation,
                              context: context,
                              style: alertStyle,
                            ).show();
                          },
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'SEE ADVICES',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              color: kInactiveColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'SAVE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)),
                              color: kInactiveColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: kBottomContainerStyle,
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: Center(
                  child: Text(
                    'Recalculate',
                    style: kBottomContainerTextStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
