import 'package:google_fonts/google_fonts.dart';
import 'package:location_tracker/auth/auth.dart';
import 'package:location_tracker/pages/welcome.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static final routeName = 'settings';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuthenticationService _auth = FirebaseAuthenticationService();

  get value => null;
  bool _toggled = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SwitchListTile(
              title: Text(
                'Activate security',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18)),
              ),
              secondary: Icon(
                Icons.security_rounded,
                color: Colors.indigo[400],
              ),
              value: _toggled,
              onChanged: (bool value) {
                setState(() {
                  _toggled = value;
                });
              },
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 9,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.indigo[400],
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  TextButton(
                      onPressed: () async {
                        await _auth.logout().then((user) => {
                              if (user == null)
                                {
                                  Navigator.pushReplacementNamed(
                                      context, WelcomePage.routeName)
                                }
                            });
                      },
                      child: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
