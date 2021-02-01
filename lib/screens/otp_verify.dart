import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CRS/pallete.dart';
import 'package:CRS/service/rounded-button.dart';
import 'package:CRS/service/text-field-input.dart';
import 'package:CRS/service/user_auth.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../pallete.dart';

class OtpVerify extends StatefulWidget {
  OtpVerify({@required this.id});
  final String id;
  @override
  _OtpVerifyState createState() => _OtpVerifyState(id: id);
}

class _OtpVerifyState extends State<OtpVerify> {
  _OtpVerifyState({@required this.id});
  final String id;
  String code;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: kBlue,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kWhite,
                ),
              ),
              title: Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  height: 1.5,
                  fontFamily: 'PTSans',
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          'Enter the which already sent to your mobile no',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputField(
                        ontap: (value) {
                          code = value;
                        },
                        icon: FontAwesomeIcons.envelope,
                        hint: 'OTP',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        buttonName: 'Submit',
                        ontap: () async {
                          setState(() {
                            showspinner = true;
                          });
                          http.Response response =
                              await registerotpverify(code, id);
                          String data = response.body;
                          dynamic decodedData = jsonDecode(data);
                          // showspinner = true;
                          if (response.statusCode == 201) {
                            setState(() {
                              showspinner = false;
                            });
                            Alert(
                              context: context,
                              title: 'Sucessfully Registered',
                              desc: decodedData['message'],
                            ).show();
                            // Navigator.pop(context);
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
