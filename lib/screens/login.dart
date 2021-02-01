import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CRS/service/user_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:CRS/screens/dashboard_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:CRS/service/constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  dynamic decodedData;
  String email;
  String password;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                // Color(0xFF8A2387),
                // Color(0xFFE94057),
                // Color(0xFFF27121),
                // Color(0xFF262AAA),
                Colors.blue.shade700,
                Colors.blue.shade400,
                Colors.lightBlueAccent,
              ]),
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      child: Image(
                        image: AssetImage('images/police.png'),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      height: 390,
                      width: 325,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Login',
                            style: basicTextStyle,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 250,
                            child: TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                labelText: 'E-mail Address',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: TextField(
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    color: Colors.blueAccent[700],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
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
                                    builder: (BuildContext context) =>
                                        DashBoard(
                                      name: decodedData['name'],
                                      email: decodedData['email'],
                                      token: decodedData['token'],
                                      img: decodedData['image'],
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
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.blue.shade700,
                                      Colors.blue.shade400,
                                      Colors.lightBlueAccent,
                                    ]),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
