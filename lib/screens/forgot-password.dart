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

// class ForgotPassword extends StatelessWidget {
//   String email;
//   bool showspinner = false;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return ModalProgressHUD(
//       inAsyncCall: showspinner,
//       child: Stack(
//         children: [
//           Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: kBlue,
//               elevation: 0,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios,
//                   color: kWhite,
//                 ),
//               ),
//               title: Text(
//                 'Forgot Password',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.white,
//                   height: 1.5,
//                   fontFamily: 'PTSans',
//                 ),
//               ),
//               centerTitle: true,
//             ),
//             body: Column(
//               children: [
//                 Center(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: size.height * 0.1,
//                       ),
//                       Container(
//                         width: size.width * 0.8,
//                         child: Text(
//                           'Enter your email we will send instruction to reset your password',
//                           style: kBodyText,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TextInputField(
//                         ontap: (value) {
//                           email = value;
//                         },
//                         icon: FontAwesomeIcons.envelope,
//                         hint: 'Email',
//                         inputType: TextInputType.emailAddress,
//                         inputAction: TextInputAction.done,
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       RoundedButton(
//                         buttonName: 'Send',
//                         ontap: () async {
//                           http.Response response =
//                               await citizenforgotpassword(email);
//                           String data = response.body;
//                           dynamic decodedData = jsonDecode(data);
//                           // showspinner = true;
//                           if (response.statusCode == 200) {
//                             Alert(
//                               context: context,
//                               title: 'Sucessfully Email Sent',
//                               desc: decodedData['message'],
//                             ).show();
//                           } else {
//                             Alert(
//                               context: context,
//                               title: 'Error ${response.statusCode}!',
//                               desc: decodedData['message'],
//                             ).show();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email;
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
                'Forgot Password',
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
                          'Enter your email we will send E-mail to reset your password',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputField(
                        ontap: (value) {
                          email = value;
                        },
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        buttonName: 'Send',
                        ontap: () async {
                          setState(() {
                            showspinner = true;
                          });
                          if (email == null) {
                            setState(() {
                              showspinner = false;
                            });
                            Alert(
                              context: context,
                              title: 'Please Fill the Form!',
                              desc: 'Invalid E-mail',
                            ).show();
                          } else {
                            http.Response response =
                                await citizenforgotpassword(email);
                            String data = response.body;
                            dynamic decodedData = jsonDecode(data);
                            // showspinner = true;
                            if (response.statusCode == 200) {
                              setState(() {
                                showspinner = false;
                              });
                              Alert(
                                context: context,
                                title: 'Sucessfully Email Sent',
                                desc: decodedData['message'],
                              ).show();
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
                          }
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
