import 'dart:ui';

import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'PersonalisedCard.dart';
import 'GenderWidget.dart';
import 'Constants.dart';
import 'ResultsPage.dart';
import 'BottomButton.dart';
import 'RoundIconButton.dart';
import 'InitialAlert.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 170;
  int selectedWeight = 60;
  int selectedAge = 20;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return InitialAlert();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: PersonalisedCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColor: (selectedGender == Gender.male)
                        ? kActiveCardColor
                        : Color(0xFF0A0E21),
                    cardChild: GenderWidget(
                      myIcon: FontAwesomeIcons.mars,
                      myString: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: PersonalisedCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColor: (selectedGender == Gender.female)
                        ? kActiveCardColor
                        : Color(0xFF0A0E21),
                    cardChild: GenderWidget(
                      myIcon: FontAwesomeIcons.venus,
                      myString: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PersonalisedCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        selectedHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kInactiveColorSlider,
                        activeTrackColor: Colors.white,
                        thumbColor: kActiveColorSlider,
                        overlayColor: Color(0x29E6F55F),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          selectedHeight = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: PersonalisedCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              myIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (selectedWeight > kMinWeight) {
                                    selectedWeight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              myIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (selectedWeight < kMaxWeight) {
                                    selectedWeight++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PersonalisedCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              myIcon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (selectedAge > kMinAge) {
                                    selectedAge--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              myIcon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (selectedAge < kMaxAge) {
                                    selectedAge++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            bottomText: 'Calculate your BMI',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: selectedHeight, weight: selectedWeight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmi: calc.calculateBMI(),
                            classification: calc.getResultClassification(),
                            interpretation: calc.getResultInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
