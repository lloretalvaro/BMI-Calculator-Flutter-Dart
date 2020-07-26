import 'dart:ui';

import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/PersonalisedCard.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.classification,
      @required this.interpretation});

  final String bmi;
  final String classification;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Text(
                'Your result',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 9,
              child: PersonalisedCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      classification,
                      style: TextStyle(
                          color: (classification == 'NORMAL')
                              ? Colors.greenAccent[200]
                              : Colors.redAccent[200],
                          fontSize: 25),
                    ),
                    Text(
                      bmi,
                      style: kNumberTextStyle.copyWith(fontSize: 80),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
                bottomText: 'Recalculate your BMI',
                onTap: () => Navigator.pop(context)),
          ],
        ));
  }
}
