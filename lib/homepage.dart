import 'dart:math';

import 'package:bmical/container.dart';
import 'package:bmical/data_for_container.dart';
import 'package:flutter/material.dart';

Color withoutTab = Color.fromARGB(255, 153, 145, 145);
Color afterTab = Color.fromARGB(255, 55, 52, 52);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleBoxColor = afterTab;
  Color femaleBoxColor = withoutTab;
  int height = 150;
  int weight = 20;
  void updateBox(int gender) {
    if (gender == 1) {
      if (maleBoxColor == withoutTab) {
        maleBoxColor = afterTab;
        femaleBoxColor = withoutTab;
      } else {
        maleBoxColor = withoutTab;
        femaleBoxColor = afterTab;
      }
    } else {
      if (femaleBoxColor == withoutTab) {
        femaleBoxColor = afterTab;
        maleBoxColor = withoutTab;
      } else {
        femaleBoxColor = withoutTab;
        maleBoxColor = afterTab;
      }
    }
  }

  double bmiCalculate(int weight, int height) {
    double result = weight / pow(height / 100, 2);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 26, 27),
      appBar: AppBar(
        title: const Text(
          'Bmi Calculator',
          style: TextStyle(
              color: Color.fromARGB(255, 139, 159, 175),
              fontWeight: FontWeight.w900),
        ),
        backgroundColor: Color.fromARGB(255, 55, 52, 52),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBox(1);
                    });
                  },
                  child: containerBox(
                    boxColor: maleBoxColor,
                    childWidget: DataContainer(
                      icon: Icons.male,
                      gender: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBox(0);
                    });
                  },
                  child: containerBox(
                    boxColor: femaleBoxColor,
                    childWidget: DataContainer(
                      icon: Icons.female,
                      gender: 'Female',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: containerBox(
                  boxColor: withoutTab,
                  childWidget: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        "HEIGHT",
                        style: textstyle1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: textstyle2,
                          ),
                          Text(
                            'cm',
                            style: textstyle3,
                          )
                        ],
                      ),
                      Slider(
                        activeColor: Color.fromARGB(255, 79, 114, 143),
                        inactiveColor: afterTab,
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: containerBox(
                  boxColor: withoutTab,
                  childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: textstyle1),
                        Text(
                          weight.toString(),
                          style: textstyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(255, 79, 114, 143),
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.exposure_minus_1,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(255, 79, 114, 143),
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight++;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.plus_one,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            final String result =
                bmiCalculate(weight, height).toString().substring(0, 5);

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: 190.0,
                      width: 220.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Result:",
                            style: textstyle1,
                          ),
                          Text(
                            result,
                            style: textstyle2,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Calculate',
                  style: textstyle2,
                ),
              ],
            ),
            margin: EdgeInsets.only(
                top: 10.0, left: 80.0, right: 80.0, bottom: 30.0),
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 79, 114, 143),
            ),
          ),
        ),
      ]),
    );
  }
}
