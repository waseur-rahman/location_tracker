import 'dart:async';
import 'package:location_tracker/pages/launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static final String routeName = '/splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, LauncherPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'images/logo3.png',
                width: 190,
                height: 190,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Padding(padding: const EdgeInsets.only(bottom: 14)),
            Text('Safely',
                style: GoogleFonts.satisfy(
                  textStyle: TextStyle(
                    color: Colors.indigo[700],
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
