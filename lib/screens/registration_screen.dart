import 'package:flutter/material.dart';
import 'package:CRS/service/textfield.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String mobileno;
  String name;
  String address;
  String pin;
  String state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset('images/police.png'),
                ),
                SizedBox(
                  height: 65.0,
                ),
                TextFieldPage(
                  hintText: 'E-mail',
                  onTap: (value) {
                    email = value;
                  },
                  secure: false,
                  lineHeight: 1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFieldPage(
                  hintText: 'Password',
                  onTap: (value) {
                    password = value;
                  },
                  secure: false,
                  lineHeight: 1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFieldPage(
                  hintText: 'Mobile No',
                  onTap: (value) {
                    mobileno = value;
                  },
                  secure: false,
                  lineHeight: 1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFieldPage(
                  hintText: 'Name',
                  onTap: (value) {
                    name = value;
                  },
                  secure: false,
                  lineHeight: 1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFieldPage(
                  hintText: 'Address',
                  onTap: (value) {
                    address = value;
                  },
                  secure: false,
                  lineHeight: 4,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFieldPage(
                  hintText: 'Pin',
                  onTap: (value) {
                    pin = value;
                  },
                  secure: false,
                  lineHeight: 1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFieldPage(
                  hintText: 'State',
                  onTap: (value) {
                    state = value;
                  },
                  secure: false,
                  lineHeight: 1,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        //After Pressing A Citizen User Will be created.
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
