import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmi, this.string, this.result);
  final String bmi, string, result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "YOUR RESULT",
                style: ktitlestyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                kactiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      string,
                      style: kresultStyle,
                    ),
                    Text(
                      bmi,
                      style: krBMIesultStyle,
                    ),
                    Text(
                      result,
                      style: kbodyTextresultStyle,
                    ),
                  ],
                ),
                () {}),
          ),
        ],
      ),
    );
  }
}
