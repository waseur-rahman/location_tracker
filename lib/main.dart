import 'package:location_tracker/pages/nearby_page.dart';
import 'package:location_tracker/pages/home_page.dart';
import 'package:location_tracker/pages/launcher.dart';
import 'package:location_tracker/pages/login.dart';
import 'package:location_tracker/pages/navbar_page.dart';
import 'package:location_tracker/pages/settings.dart';
import 'package:location_tracker/pages/signup.dart';
import 'package:location_tracker/pages/splash_screen.dart';
import 'package:location_tracker/pages/welcome.dart';
import 'package:location_tracker/providers/location_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.red[300]));
  runApp(CallWiz());
}

class CallWiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LocationProvider(),
            child: HomePage(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: {
            SplashScreen.routeName: (ctx) => SplashScreen(),
            LauncherPage.routeName: (ctx) => LauncherPage(),
            WelcomePage.routeName: (ctx) => WelcomePage(),
            LoginPage.routeName: (ctx) => LoginPage(),
            SignupPage.routeName: (ctx) => SignupPage(),
            NavbarPage.routeName: (ctx) => NavbarPage(),
            HomePage.routeName: (ctx) => HomePage(),
            NearbyPage.routeName: (ctx) => NearbyPage(),
            SettingsPage.routeName: (ctx) => SettingsPage(),
          },
        ));
  }
}
