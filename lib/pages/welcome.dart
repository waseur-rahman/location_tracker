import 'package:location_tracker/pages/login.dart';
import 'package:location_tracker/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  static final String routeName = '/welcome';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                // left: 0,
                // top: 0,
                // right: 0,
                // bottom: 0,
                child: Container(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                //color: Colors.brown.withOpacity(.60),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 120),
                        //alignment: Alignment.center,
                        child: Stack(children: [
                          Positioned(
                            top: 0,
                            left: 110,
                            child: Image.asset(
                              'images/logo2.png',
                              height: 295,
                              width: 370,
                            ),
                          ),
                          Positioned(
                            child: Text(
                              "Hey, let's explore this brand new world! ",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.indigo[900],
                                    fontSize: 41,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 300,
                            height: 55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red[600].withOpacity(0.80),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(29))),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, LoginPage.routeName);
                                },
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 300,
                            height: 55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white.withOpacity(.70),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(29))),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, SignupPage.routeName);
                                },
                                child: Text(
                                  'SIGNUP',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(color: Colors.black),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
