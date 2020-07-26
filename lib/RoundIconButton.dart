import 'package:flutter/material.dart';
import 'Constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.myIcon, @required this.onPress});

  final IconData myIcon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(myIcon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: kRoundIconColor,
    );
  }
}
