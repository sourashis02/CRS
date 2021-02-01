import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:CRS/screens/first_screen.dart';
import 'package:CRS/screens/create-new-account.dart';
import 'package:CRS/screens/dashboard_screen.dart';

import 'screens/screens.dart';

void main() => runApp(CRS());

class CRS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //     scaffoldBackgroundColor: Colors.white,
      //     primaryColor: Colors.white,
      //     textTheme: TextTheme(
      //       body1: TextStyle(color: Colors.black54),
      //     ),
      //     ),
      // initialRoute: 'home',
      home: AnimatedSplashScreen(
        splash: Image.asset('images/police.png'),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.scaleTransition,
      ),
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'ForgotPassword': (context) => ForgotPassword(),
        // 'RegisterComplaint': (context) => RegisterComplaint(),
      },
    );
  }
}
