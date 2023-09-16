import 'dart:ffi';

import 'package:bmi_project/BMI.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String Gender;
  double height;
  int weight;
  int age;
  double RE;
  Result(
      {required this.Gender,
      required this.height,
      required this.weight,
      required this.age,
      required this.RE});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff180839),
      appBar: AppBar(
        backgroundColor: Color(0xff180839),
        title: Text(
          "BMI CALCULATER",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Your Result",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff70638e)),
                    height: 600,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Gender : $Gender",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Height : ${height.round()}",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Weight : $weight",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Age : $age",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Result = ${RE.round()}",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 53, 227, 59),
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 60,
              color: Color(0xfffdb096),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMIScreen()),
                  );
                },
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
