import 'package:location_tracker/auth/auth.dart';
import 'package:location_tracker/pages/navbar_page.dart';
import 'package:location_tracker/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errMsg = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        backgroundColor: Colors.white,
        body: Container(
          child: Form(
            key: _formKey,
            child: ListView(children: [
              Stack(children: [
                Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Positioned(
                  bottom: 20,
                  top: 30,
                  left: 170,
                  child: Image.asset(
                    'images/login.png',
                    height: 230,
                    width: 250,
                  ),
                ),
                Positioned(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
                      child: Text(
                        'Welcome Back!',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 45,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.indigo[900]),
                  ),
                  cursorColor: Colors.red[400],
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.indigo[100]),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.red[100],
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink[200]),
                          borderRadius: BorderRadius.circular(29)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo[800], width: 1.5),
                          borderRadius: BorderRadius.circular(29)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[700]),
                          borderRadius: BorderRadius.circular(29)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(29))),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
              ),
              SizedBox(),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.indigo[900]),
                  ),
                  obscureText: true,
                  cursorColor: Colors.red[400],
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.indigo[100]),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Colors.red[100],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink[200]),
                        borderRadius: BorderRadius.circular(29)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.indigo[800], width: 1.5),
                        borderRadius: BorderRadius.circular(29)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red[700]),
                        borderRadius: BorderRadius.circular(29)),
                    focusedErrorBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(29)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password cannot be empty.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 15, bottom: 15),
                child: TextButton(
                    style: ButtonStyle(alignment: Alignment.bottomRight),
                    onPressed: () {},
                    child: Text('Forgot Password?',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.indigo[200], fontSize: 16),
                        ))),
              ),
              SizedBox(),
              Center(
                  child: Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: _loginUser,
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[600],
                              //side: BorderSide(color: Colors.red, width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29))),
                          child: Text('Login', style: GoogleFonts.poppins())))),
              SizedBox(
                height: 10,
              ),
              Text(
                this.errMsg,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Colors.indigo[200], fontSize: 14)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SignupPage.routeName);
                      },
                      child: Text('Signup',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.red[400],
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          )))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  void _loginUser() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseAuthenticationService.login(email, password)
          .then((user) => {
                if (user != null)
                  {
                    Navigator.pushReplacementNamed(
                        context, NavbarPage.routeName),
                  }
              })
          .catchError((error) {
        setState(() {
          errMsg = error.message;
        });
      });
    }
  }
}
