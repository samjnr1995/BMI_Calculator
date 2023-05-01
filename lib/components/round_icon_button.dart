import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final Function()? Pressed;
  RoundIconButton({required this.icon, required this.Pressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: Pressed!
    );
  }
}
