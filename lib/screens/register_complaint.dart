// import 'dart:html';
import 'dart:ui';
// import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:CRS/pallete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:CRS/pallete.dart';
import 'package:CRS/service/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:date_time_picker/date_time_picker.dart';
import 'package:CRS/widget/notifcation_dialog.dart';
import 'package:CRS/service/user_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:CRS/service/constant.dart';
// import 'package:CRS/service/round_icon_button.dart';

class RegisterComplaint extends StatefulWidget {
  RegisterComplaint({@required this.token});
  final String token;
  @override
  _RegisterComplaintState createState() =>
      _RegisterComplaintState(token: token);
}

class _RegisterComplaintState extends State<RegisterComplaint> {
  _RegisterComplaintState({@required this.token});
  final String token;
  String title;
  String type;
  String location;
  // DateTime selectedDate = DateTime.now();
  // final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  String description;
  String dTime;
  String pincode;
  bool showspinner = false;
  @override
  void initState() {
    _getStateList();
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
                  Column(
                    children: [
                      Text(
                        'Register Complaint',
                        style: TextStyle(
                          fontSize: 35,
                          color: Color(0xFF0D47A1),
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Column(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: <Widget>[
                      //     Text(
                      //       "${selectedDate.toLocal()}".split(' ')[0],
                      //       style: TextStyle(
                      //           fontSize: 30, fontWeight: FontWeight.bold),
                      //     ),
                      //     SizedBox(
                      //       height: 20.0,
                      //     ),
                      //     RaisedButton(
                      //       onPressed: () =>
                      //           _selectDate(context), // Refer step 3
                      //       child: Text(
                      //         'Select date',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       color: kBlue,
                      //     ),
                      //   ],
                      // ),
                      Container(
                        padding: EdgeInsets.fromLTRB(32, 5, 32, 5),
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMM, yyyy',
                          initialValue: null,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Time",
                          // selectableDayPredicate: (date) {
                          //   // Disable weekend days to select from the calendar
                          //   if (date.weekday == 6 || date.weekday == 7) {
                          //     return false;
                          //   }

                          //   return true;
                          // },
                          onChanged: (val) {
                            dTime = DateTime.parse(val).toIso8601String();
                          },
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) {
                            dTime = DateTime.parse(val).toIso8601String();
                          },
                        ),
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text(dateFormat.format(selectedDate)),
                      //     RaisedButton(
                      //       child: Text('Choose new date time'),
                      //       onPressed: () async {
                      //         showDateTimeDialog(context,
                      //             initialDate: selectedDate,
                      //             onSelectedDate: (selectedDate) {
                      //           setState(() {
                      //             this.selectedDate = selectedDate;
                      //             dateTime =
                      //                 this.selectedDate.toIso8601String();
                      //             print(dateTime);
                      //             print(this.selectedDate);
                      //           });
                      //         });
                      //       },
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      TextInputField(
                        ontap: (value) {
                          title = value;
                        },
                        icon: Icons.title,
                        hint: 'Title',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        ontap: (value) {
                          type = value;
                        },
                        icon: Icons.merge_type_sharp,
                        hint: 'Type',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        ontap: (value) {
                          location = value;
                        },
                        icon: Icons.location_city_sharp,
                        hint: 'Location',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      // SizedBox(
                      //   height: size.width * 0.1,
                      // ),
                      Container(
                        height: 150.0,
                        child: TextInputField(
                          ontap: (value) {
                            description = value;
                          },
                          icon: Icons.description_rounded,
                          hint: 'Description',
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
                        buttonName: 'Submit',
                        ontap: () async {
                          setState(() {
                            showspinner = true;
                          });
                          print(dTime);
                          http.Response response = await registercomplaint(
                            dTime,
                            title,
                            type,
                            token,
                            location,
                            description,
                            pincode,
                            _myState,
                            _mydistrict,
                            _mydivision,
                            _mypolicestation,
                          );
                          dynamic data = response.body;
                          // var statuscode = response.statusCode;
                          dynamic decodedData = jsonDecode(data);
                          if (response.statusCode == 201) {
                            setState(() {
                              showspinner = false;
                            });
                            Alert(
                              context: context,
                              title: 'Successfull ${response.statusCode}!',
                              desc: decodedData['message'],
                            ).show();
                          } else {
                            Alert(
                              context: context,
                              title: 'Error ${response.statusCode}!',
                              desc: decodedData['message'],
                            ).show();
                          }
                          // Navigator.pop(context);
                          setState(() {
                            showspinner = false;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
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

  // _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate, // Refer step 1
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   dateTime = selectedDate.toIso8601String();
  //   print(dateTime);
  // }

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
