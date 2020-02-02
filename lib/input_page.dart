import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculateBMI.dart';

enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender;
  int height = 180;
  int weight = 56;
  int age = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI  Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      selectedGender == gender.male
                          ? kactiveCardColor
                          : kinactivecolor,
                      ReusableCardChild(FontAwesomeIcons.mars, "MALE"),
                      () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      selectedGender == gender.female
                          ? kactiveCardColor
                          : kinactivecolor,
                      ReusableCardChild(FontAwesomeIcons.venus, "FEMALE"),
                      () {
                        setState(() {
                          selectedGender = gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kactiveCardColor,
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: klabelstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kvalues,
                            ),
                            Text(
                              "cm",
                              style: klabelstyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF7d7e98),
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x29eb1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double OnChanged) {
                              setState(() {
                                height = OnChanged.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  () {}),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        kactiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: klabelstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kvalues,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kactiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "AGE",
                              style: klabelstyle,
                            ),
                            Text(
                              age.toString(),
                              style: kvalues,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculateBMI cal = CalculateBMI(weight, height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(cal.getBMI(),
                            cal.getResult(), cal.Intrepretation())));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: kLargevalues,
                  ),
                ),
                color: kbottomCol,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: kbottomNavbarheigh,
              ),
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.child, this.onPressed);

  final IconData child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: null,
        child: Icon(
          child,
          color: Colors.white,
        ),
        onPressed: onPressed,
        elevation: 0,
        shape: CircleBorder(),
        backgroundColor: Color(0xFF4C4F5E));
  }
}
