import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CRS/pallete.dart';
import 'package:CRS/service/widgets.dart';
import 'package:CRS/service/user_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:CRS/screens/dashboard_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../pallete.dart';
import '../service/rounded-button.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  dynamic decodedData;
  String email;
  String password;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Image(
                        image: AssetImage('images/police.png'),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      ontap: (value) {
                        email = value;
                      },
                    ),
                    PasswordInput(
                      ontap: (value) {
                        password = value;
                      },
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'ForgotPassword'),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 22,
                          color: kBlue,
                          height: 1.5,
                          fontFamily: 'PTSans',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                      ontap: () async {
                        setState(() {
                          showspinner = true;
                        });
                        http.Response response =
                            await citizenlogin(email, password);
                        print(response.statusCode);
                        String data = response.body;
                        decodedData = jsonDecode(data);
                        if (response.statusCode == 200) {
                          setState(() {
                            showspinner = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => DashBoard(
                                name: decodedData['name'],
                                email: decodedData['email'],
                                token: decodedData['token'],
                                img: decodedData['id'],
                              ),
                            ),
                          );
                        } else {
                          Alert(
                            context: context,
                            title: 'Error ${response.statusCode}!',
                            desc: decodedData['message'],
                          ).show();
                        }
                        setState(() {
                          showspinner = false;
                        });
                      },
                      buttonName: 'Login',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not have an account?',
                      style: kBodyText,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'CreateNewAccount');
                      },
                      child: Text(
                        'Register',
                        style: kBodyText.copyWith(
                            color: kBlue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // RoundedButton(buttonName: 'Register', ontap: () {}),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
