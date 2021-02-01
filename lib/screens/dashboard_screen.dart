import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:CRS/screens/complaint_status.dart';
import 'package:CRS/service/user_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:CRS/screens/register_complaint.dart';
import 'package:CRS/screens/profile.dart';

import '../service/user_auth.dart';
import 'profile.dart';

class DashBoard extends StatefulWidget {
  DashBoard({
    @required this.email,
    @required this.name,
    @required this.token,
    @required this.img,
  });
  final String name;
  final String email;
  final String token;
  final String img;
  @override
  _DashBoardState createState() => _DashBoardState(
        token: token,
        name: name,
        img: img,
        email: email,
      );
}

class _DashBoardState extends State<DashBoard> {
  _DashBoardState(
      {@required this.email,
      @required this.img,
      @required this.name,
      @required this.token});
  final String name;
  final String email;
  final String token;
  final String img;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  // CircleAvatar(
                  //   radius: 65.0,
                  //   backgroundColor: Colors.blue.shade300,
                  //   backgroundImage: NetworkImage(
                  //     'https://crime-registration-system.herokuapp.com$img',
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PTSans',
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.teal[100],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterComplaint(
                              token: token,
                            ),
                          ),
                        );
                      },
                      leading: Icon(
                        LineAwesomeIcons.user_shield,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Register Complaint',
                        style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      onTap: () async {
                        setState(() {
                          showspinner = true;
                        });
                        http.Response response = await complaints(token);
                        dynamic data = response.body;
                        dynamic variable = jsonDecode(data);
                        // if (response.statusCode == 404) {
                        //   setState(() {
                        //     showspinner = false;
                        //   });
                        //   Alert(
                        //     context: context,
                        //     title: 'Error ${response.statusCode}!',
                        //     desc: variable['message'],
                        //   ).show();
                        // }
                        if (response.statusCode == 200) {
                          setState(() {
                            showspinner = false;
                          });
                          List complains = jsonDecode(data);
                          print(complains[0]['status']);
                          print(complains.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComplaintStatus(
                                token: token,
                                complaints: complains,
                              ),
                            ),
                          );
                        } else {
                          Alert(
                            context: context,
                            title: 'Error ${response.statusCode}!',
                            desc: variable['message'],
                          ).show();
                        }
                        setState(() {
                          showspinner = false;
                        });
                      },
                      leading: Icon(
                        Icons.history,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Complaint History',
                        style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      onTap: () async {
                        setState(() {
                          showspinner = true;
                        });
                        http.Response response =
                            await getprofileinfo(token, img);
                        dynamic data = response.body;
                        dynamic decoded = jsonDecode(data);
                        if (response.statusCode == 200) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(
                                name: decoded['name'],
                                email: decoded['email'],
                                phone: decoded['phone'],
                                address: decoded['address'],
                                pincode: decoded['pincode'],
                                state: decoded['state'],
                                district: decoded['district'],
                                division: decoded['division'],
                                policestation: decoded['policeStation'],
                              ),
                            ),
                          );
                        } else {
                          Alert(
                            context: context,
                            title: 'Error ${response.statusCode}!',
                            desc: decoded['message'],
                          ).show();
                        }
                        setState(() {
                          showspinner = false;
                        });
                      },
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  // Card(
                  //   margin:
                  //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  //   child: ListTile(
                  //     leading: Icon(
                  //       LineAwesomeIcons.question_circle,
                  //       color: Colors.black,
                  //     ),
                  //     title: Text(
                  //       'Help & Suppport',
                  //       style: TextStyle(
                  //         fontFamily: 'PTSans',
                  //         fontSize: 20.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      onTap: () {
                        http.post(
                          'https://crime-registration-system.herokuapp.com/auth/logout',
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                            'Authorization': 'Bearer ' + token,
                          },
                        );
                        Navigator.pop(
                          context,
                        );
                      },
                      leading: Icon(
                        LineAwesomeIcons.alternate_sign_out,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'PTSans',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
