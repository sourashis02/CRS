import 'package:CRS/screens/login-screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:CRS/service/constant.dart';
import 'package:CRS/service/round_icon_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Welcome',
                  style: kfirstscreenheadingtextstyle,
                ),
                SizedBox(
                  height: 15,
                ),
                TyperAnimatedTextKit(
                  text: ["Crime Registration System"],
                  textStyle: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 155.0,
                ),
                RoundIconButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  image: 'images/citizen.png',
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Citizen',
                  style: actorTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
