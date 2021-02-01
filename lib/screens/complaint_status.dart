import 'package:CRS/pallete.dart';
import 'package:flutter/material.dart';
import 'package:CRS/service/complaint.dart';

// class ComplaintStatus extends StatelessWidget {
//   ComplaintStatus(
//       {@required this.date, @required this.id, @required this.status});
//   final String id;
//   final String date;
//   final String status;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         title: Text('Complaints'),
//       ),
//       body: Complaint(
//         status: status,
//         date: date,
//         id: id,
//       ),
//     );
//   }
// }

class ComplaintStatus extends StatefulWidget {
  ComplaintStatus({@required this.complaints, @required this.token});
  final List complaints;
  final String token;
  @override
  _ComplaintStatusState createState() =>
      _ComplaintStatusState(complaints: complaints, token: token);
}

class _ComplaintStatusState extends State<ComplaintStatus> {
  _ComplaintStatusState({
    @required this.complaints,
    @required this.token,
  });
  final List complaints;
  final String token;
  // List complaint = complaints;
  // List<Widget> clist = [];
  String status;
  String date;
  String id;

  // @override
  // Future initState() async {
  //   super.initState();
  // http.Response response = await complaints(token);
  //   var data = response.body;
  //   complaint = jsonDecode(data);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: hexToColor('#12375F'),
        title: Text('Complaints'),
      ),
      body: ListView(
        children: complain(complaints, token),
      ),
    );
  }
}

List<Widget> complain(List complaint, String token) {
  List<Widget> clist = [];
  // String cool;
  for (var i = 0; i < complaint.length; i++) {
    clist.add(
      Complaint(
        // status: complaint[i]['status'],
        // cool = complaint[i]['date'],
        date: complaint[i]['date'],
        id: complaint[i]['id'],
        type: complaint[i]['type'],
        progress: complaint[i]['progress'],
        title: complaint[i]['title'],
        token: token,
        // complaint: complaint,
      ),
    );
  }
  return clist;
}
