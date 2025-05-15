

import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget{
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return MyHomePage(); }));
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
        Container(
          color: Colors.black,
          child: Center(
            child: Container(
              child: Text("BMI CHECKER", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40, color: Colors.white),),
            ),
          ),
        )
    );


  }
}