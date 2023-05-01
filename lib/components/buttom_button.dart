import 'package:flutter/material.dart';
import '../constants.dart';
class ButtomButton extends StatelessWidget {

  final Function()? press;
  final String? buttonTitle;

  ButtomButton({ required this.press, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Center(child: Text(buttonTitle!, style: kLargeButtonTextStyle,)),
        color: kContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 30.0),
        width: double.infinity,
        height: kButtomContainerHeight,
      ),
    );
  }
}
