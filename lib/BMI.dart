import 'dart:ffi';
import 'dart:math';

import 'package:bmi_project/Result.dart';

import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  var gender = "male";

  bool ismale = true;
  double HEIGHT = 180;
  int WEIGHT = 40;
  int AGE = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff180839),
      appBar: AppBar(
        backgroundColor: Color(0xff180839),
        title: Text(
          "BMI CALCULATER",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    ismale = true;
                    gender = "male";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ismale ? Color(0xfffdb096) : Color(0xff70638e)),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        "MALE",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    ismale = false;
                    gender = "female";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ismale ? Color(0xff70638e) : Color(0xfffdb096)),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        "FEMALE",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ))
            ]),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff70638e)),
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(color: Colors.white38, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${HEIGHT.round()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(color: Colors.white38, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    thumbColor: Color(0xfffdb096),
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    min: 80,
                    max: 250,
                    value: HEIGHT,
                    onChanged: (value) {
                      setState(() {
                        HEIGHT = value;
                      });
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff70638e),
                  ),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(fontSize: 20, color: Colors.white38),
                      ),
                      Text(
                        "$WEIGHT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                WEIGHT--;
                              });
                            },
                            child: Icon(Icons.remove),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                WEIGHT++;
                              });
                            },
                            child: Icon(Icons.add),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff70638e),
                  ),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(fontSize: 20, color: Colors.white38),
                      ),
                      Text(
                        "$AGE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                AGE--;
                              });
                            },
                            child: Icon(Icons.remove),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                AGE++;
                              });
                            },
                            child: Icon(Icons.add),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: 60,
            color: Color(0XFFfdb096),
            child: MaterialButton(
              onPressed: () {
                double result = WEIGHT / pow(HEIGHT / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            height: HEIGHT,
                            Gender: gender,
                            weight: WEIGHT,
                            age: AGE,
                            RE: result,
                          )),
                );
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
