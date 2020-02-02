import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCardChild extends StatelessWidget {
  ReusableCardChild(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: klabelstyle,
        ),
      ],
    );
  }
}
