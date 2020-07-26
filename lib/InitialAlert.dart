import 'package:flutter/material.dart';
import 'Constants.dart';
import 'PersonalisedCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialAlert extends StatelessWidget {
  const InitialAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 300,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: PersonalisedCard(
          cardColor: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.infoCircle,
                color: kActiveColorSlider,
                size: 70,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Select your gender, weight, height and age',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none),
                ),
              ),
              RaisedButton(
                color: kActiveColorSlider,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
