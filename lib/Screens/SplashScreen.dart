import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/Authentication.dart';
import 'dart:async';

import 'package:whatsapp_clone/Screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Authentication()
    )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello Splash"),
      ),
    );
  }
}