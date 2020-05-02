import 'dart:async';
import 'package:cornavirustracker/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Dashboard.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomePage()
    },
  ));
}

//code for Splash Screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(5.0),
          color: Colors.black,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/covid19.png',
                    fit: BoxFit.cover,
                  ),
                ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Center(
            child: Text(
              "Tracker",
              style: GoogleFonts.specialElite(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
        ],),
        ),
      ),
    );
  }
}