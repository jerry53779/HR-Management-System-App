import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internapp/actuallogin.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  bool _alreadyNavigated = false;

  @override
  void initState() {
    super.initState();

    if (!_alreadyNavigated) {
      Timer(
        Duration(seconds: 5),
            () {
          _alreadyNavigated = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyApplication()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFff8080),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TyperAnimatedTextKit(
              text: ['Softloom'],
              textStyle: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}