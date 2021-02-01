// import 'dart:html';
import 'dart:ui';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CRS/pallete.dart';
import 'package:CRS/service/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:CRS/service/round_icon_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:CRS/service/user_auth.dart';
import 'package:CRS/screens/otp_verify.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  // Dio dio = Dio();
  String name;
  String email;
  String password;
  String mobileno;
  String address;
  String pincode;
  // FormData formData;
  bool showspinner = false;
  @override
  void initState() {
    _getStateList();
    // print(object)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Text(
                    'Citizen Registration',
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xFF0D47A1),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image.asset('images/police.png'),
                    height: 80,
                    width: 100,
                  ),
                  // Stack(
                  //   children: [
                  //     Center(
                  //       child: ClipOval(
                  //         child: BackdropFilter(
                  //           filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  //           child: CircleAvatar(
                  //             radius: size.width * 0.14,
                  //             backgroundColor: Colors.grey[400].withOpacity(
                  //               0.4,
                  //             ),
                  //             // child: Icon(
                  //             //   FontAwesomeIcons.user,
                  //             //   color: kWhite,
                  //             //   size: size.width * 0.1,
                  //             // ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Positioned(
                  //       top: size.height * 0.08,
                  //       left: size.width * 0.56,
                  //       child: Container(
                  //         height: size.width * 0.1,
                  //         width: size.width * 0.1,
                  //         decoration: BoxDecoration(
                  //           color: kBlue,
                  //           shape: BoxShape.circle,
                  //           border: Border.all(color: kWhite, width: 2),
                  //         ),
                  //         child: RoundIconButton(
                  //           onTap: () async {
                  //             File image;
                  //             var imagepicker = await ImagePicker.pickImage(
                  //                 source: ImageSource.gallery);
                  //             if (imagepicker != null) {
                  //               setState(() {
                  //                 image = imagepicker;
                  //               });
                  //             }
                  //             try {
                  //               String filename = image.path.split('/').last;
                  //               formData = FormData.fromMap({
                  //                 "image": await MultipartFile.fromFile(
                  //                     image.path,
                  //                     filename: filename,
                  //                     contentType: MediaType('image', 'png')),
                  //                 "type": "image/png"
                  //               });
                  //               if (formData != null) {
                  //                 Alert(
                  //                   context: context,
                  //                   title: 'Successfully Image Uploaded',
                  //                   desc: 'Complete Other Section Fillup',
                  //                 ).show();
                  //               }
                  //             } catch (e) {
                  //               print(e);
                  //             }
                  //           },
                  //           image: 'images/arrow.png',
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      TextInputField(
                        ontap: (value) {
                          name = value;
                        },
                        icon: FontAwesomeIcons.user,
                        hint: 'Name',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        ontap: (value) {
                          email = value;
                        },
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        ontap: (value) {
                          mobileno = value;
                        },
                        icon: Icons.phone,
                        hint: 'Mobile No',
                        inputType: TextInputType.phone,
                        inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        ontap: (value) {
                          password = value;
                        },
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.next,
                      ),
                      // PasswordInput(
                      //   icon: FontAwesomeIcons.lock,
                      //   hint: 'Confirm Password',
                      //   inputAction: TextInputAction.done,
                      // ),
                      Container(
                        height: 150.0,
                        child: TextInputField(
                          ontap: (value) {
                            address = value;
                          },
                          icon: FontAwesomeIcons.solidAddressCard,
                          hint: 'Address',
                          inputType: TextInputType.streetAddress,
                          inputAction: TextInputAction.next,
                        ),
                      ),
                      TextInputField(
                        ontap: (value) {
                          pincode = value;
                        },
                        icon: FontAwesomeIcons.recordVinyl,
                        hint: 'Pin Code',
                        inputType: TextInputType.phone,
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: _myState,
                                    iconSize: 30,
                                    icon: (null),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                    hint: Text('Select State'),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        // print(newValue);
                                        _myState = newValue;
                                        _getDistrictsList();
                                        print(_myState);
                                      });
                                    },
                                    items: statesList?.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(item),
                                            value: item.toString(),
                                          );
                                        })?.toList() ??
                                        [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: _mydistrict,
                                    iconSize: 30,
                                    icon: (null),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                    hint: Text('Select District'),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _mydistrict = newValue;
                                        _getDivisionsList();
                                        print(_myState + ' ' + _mydistrict);
                                      });
                                    },
                                    items: districtList?.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(item),
                                            value: item.toString(),
                                          );
                                        })?.toList() ??
                                        [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: _mydivision,
                                    iconSize: 30,
                                    icon: (null),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                    hint: Text('Select Division'),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _mydivision = newValue;
                                        _getPoliceStationList();
                                        print(_myState +
                                            ' ' +
                                            _mydistrict +
                                            ' ' +
                                            _mydivision);
                                      });
                                    },
                                    items: divisionList?.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(item),
                                            value: item.toString(),
                                          );
                                        })?.toList() ??
                                        [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: _mypolicestation,
                                    iconSize: 30,
                                    icon: (null),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                    hint: Text('Select Police Station'),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _mypolicestation = newValue;
                                        print(_myState +
                                            ' ' +
                                            _mydistrict +
                                            ' ' +
                                            _mydivision +
                                            ' ' +
                                            _mypolicestation);
                                      });
                                    },
                                    items: policeStationList?.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(item),
                                            value: item.toString(),
                                          );
                                        })?.toList() ??
                                        [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      RoundedButton(
                        buttonName: 'Register',
                        ontap: () async {
                          setState(() {
                            showspinner = true;
                          });
                          http.Response response = await citizenregistration(
                            name,
                            email,
                            mobileno,
                            password,
                            address,
                            pincode,
                            _myState,
                            _mydistrict,
                            _mydivision,
                            _mypolicestation,
                          );
                          dynamic data = response.body;
                          dynamic decodedData = jsonDecode(data);
                          if (response.statusCode == 201) {
                            setState(() {
                              showspinner = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OtpVerify(id: decodedData['id']),
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
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text(
                              'Login',
                              style: kBodyText.copyWith(
                                  color: kBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API
  List statesList;
  String _myState;

  Future<String> _getStateList() async {
    String stateInfoUrl =
        'https://crime-registration-system.herokuapp.com/states';
    await http.get(stateInfoUrl).then((response) {
      var data = json.decode(response.body);

//      print(data);
      setState(() {
        statesList = data['states'];
        print(statesList);
      });
    });
  }

  // Get District information by API
  List districtList;
  String _mydistrict;

  Future<String> _getDistrictsList() async {
    String districtInfoUrl =
        'https://crime-registration-system.herokuapp.com/districts?state=$_myState';
    await http.get(districtInfoUrl).then((response) {
      var data = json.decode(response.body);

      setState(() {
        districtList = data['districts'];
        print(districtList);
      });
    });
  }

  // Get Division information by API
  List divisionList;
  String _mydivision;

  Future<String> _getDivisionsList() async {
    String divisionInfoUrl =
        'https://crime-registration-system.herokuapp.com/divisions?state=$_myState&district=$_mydistrict';
    await http.get(divisionInfoUrl).then((response) {
      var data = json.decode(response.body);

      setState(() {
        divisionList = data['divisions'];
        print(divisionList);
      });
    });
  }

  // Get Police Station information by API
  List policeStationList;
  String _mypolicestation;

  Future<String> _getPoliceStationList() async {
    String policeStationUrl =
        'https://crime-registration-system.herokuapp.com/police-stations?state=$_myState&district=$_mydistrict&division=$_mydivision';
    await http.get(policeStationUrl).then((response) {
      var data = json.decode(response.body);

      setState(() {
        policeStationList = data['policeStations'];
      });
    });
  }
}
