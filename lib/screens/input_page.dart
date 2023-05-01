import 'package:bmi_calculator/components/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconContent.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/buttom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.calculate),
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectedGender == Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: CardIcon(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectedGender == Gender.female;
                    });
                  },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: CardIcon(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),

                      ),

                )),
              ],
            )),
            Expanded(
              child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumColor,
                            ),
                            Text(
                              'CM',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                Pressed: () {
                                  setState(() {
                                    weight--;
                                    debugPrint("weight minus  $weight--");
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                Pressed: () {
                                  setState(() {
                                    weight++;
                                    debugPrint("weight plus  $weight++");
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            Pressed: () {
                              setState(
                                () {
                                  age--;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              Pressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),
            ButtomButton(
                buttonTitle: 'CALCULATE',
                press: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: calc.calculateBmi().toString(),
                                resultText: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                }),
          ],
        ));
  }
}
