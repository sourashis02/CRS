import 'dart:convert';

import 'package:CRS/service/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:CRS/service/user_auth.dart';
import 'package:date_format/date_format.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:loading_overlay/loading_overlay.dart';
// import 'package:CRS/screens/complaint_status.dart';

// class Complaint extends StatelessWidget {
//   Complaint({
//     // @required this.status,
//     @required this.date,
//     @required this.id,
//     @required this.title,
//     @required this.type,
//     @required this.progress,
//     @required this.token,
//     @required this.complaint,
//   });

//   // final String status;
//   final String id;
//   final String date;
//   final String type;
//   final String title;
//   final String progress;
//   final String token;
//   final List complaint;

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
class Complaint extends StatefulWidget {
  Complaint({
    // @required this.status,
    @required this.date,
    @required this.id,
    @required this.title,
    @required this.type,
    @required this.progress,
    @required this.token,
  });
  // final String status;
  final String id;
  final String date;
  final String type;
  final String title;
  final String progress;
  final String token;

  @override
  _ComplaintState createState() => _ComplaintState(
        id: id,
        date: date,
        type: type,
        title: title,
        progress: progress,
        token: token,
      );
}

class _ComplaintState extends State<Complaint> {
  _ComplaintState({
    @required this.date,
    @required this.id,
    @required this.progress,
    @required this.title,
    @required this.token,
    @required this.type,
  });
  final String id;
  final String date;
  final String type;
  final String title;
  final String progress;
  final String token;
  bool showspinner = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        http.Response response = await getcomplaintstatus(token, id);
        dynamic data = response.body;
        dynamic decodedData = jsonDecode(data);
        if (response.statusCode == 200) {
          Alert(
            context: context,
            title: ' Case Status',
            desc: decodedData['status'],
          ).show();
        } else {
          Alert(
            context: context,
            title: 'Error ${response.statusCode}!',
            desc: decodedData['message'],
          ).show();
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            _complaintstatus(progress),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.title,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.merge_type,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  type,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.confirmation_number_rounded,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ID",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  id,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  getDate(date),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  getTime(date),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    if (progress == 'PENDING') {
                      deletecomplaint(id, token);
                      Navigator.pop(context);
                    } else if (progress == 'RESOLVED') {
                      Alert(
                        context: context,
                        title: 'Complaint is Resolved',
                        desc:
                            'No need to withdraw it. If you have any query contact the police station immediately.',
                      ).show();
                    } else if (progress == 'REJECTED') {
                      Alert(
                        context: context,
                        title: 'Complaint is Rejected',
                        desc:
                            'No need to withdraw it. If you have any query contact the police station immediately.',
                      ).show();
                    } else {
                      Alert(
                        context: context,
                        title: 'Investigation in Process',
                        desc:
                            'If you want to withdraw complaint you are requested to visit police station as soon as possible.',
                      ).show();
                    }
                  },
                  child: Row(
                    children: [
                      Text("Withdraw Complaint"),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  padding: EdgeInsets.all(5),
                  color: Colors.green,
                  shape: StadiumBorder(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String getDate(String time) {
  var date = DateTime.parse(time);
  String timezone = formatDate(date, [dd, '-', mm, '-', yyyy]);
  return timezone;
}

String getTime(String time) {
  var date = DateTime.parse(time);
  String timemode = formatDate(date, [HH, ':', nn, ':', ss]);
  return timemode;
}

Widget _complaintstatus(String status) {
  Icon icon;
  Color color;

  if (status == "PENDING" || status == "IN-PROCESS" || status == "ON-HOLD") {
    icon = Icon(
      Icons.timer,
      color: Colors.orange,
    );
    color = Colors.orange;
  } else if (status == "RESOLVED" || status == "ACCEPTED") {
    icon = Icon(
      Icons.check,
      color: Colors.green,
    );
    color = Colors.green;
  } else if (status == "REJECTED") {
    icon = Icon(Icons.clear, color: Colors.redAccent);
    color = Colors.redAccent;
  } else {
    icon = Icon(
      Icons.clear,
      color: Colors.redAccent,
    );
    color = Colors.redAccent;
  }

  return Row(
    children: [
      icon,
      Text(
        "$status",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ],
  );
}
