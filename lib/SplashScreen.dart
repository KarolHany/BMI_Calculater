import 'dart:async';

import 'package:bmi_project/BMI.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BMIScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff180839),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "BMI",
              style: TextStyle(
                  color: Colors.white, fontSize: 70, fontFamily: "Monoton"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "CALCULATER",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "loading...",
            style: TextStyle(color: Colors.white38, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
