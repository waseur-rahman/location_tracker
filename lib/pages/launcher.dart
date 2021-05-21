import 'package:location_tracker/auth/auth.dart';
import 'package:location_tracker/pages/navbar_page.dart';
import 'package:location_tracker/pages/welcome.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static final String routeName = '/launcherpage';
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (FirebaseAuthenticationService.firebaseUser == null) {
        Navigator.pushReplacementNamed(context, WelcomePage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, NavbarPage.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.red,
      )),
    );
  }
}
