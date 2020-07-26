import 'package:flutter/material.dart';

import 'Constants.dart';

class GenderWidget extends StatelessWidget {
  GenderWidget({this.myIcon, this.myString, this.myTextColor});

  final IconData myIcon;
  final String myString;
  final Color myTextColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 65,
          color: kActiveColorSlider,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          myString,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
