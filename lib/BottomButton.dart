import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, this.bottomText});

  final Function onTap;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            bottomText,
            style: kLabel2TextStyle,
          ),
        ),
      ),
    );
  }
}
