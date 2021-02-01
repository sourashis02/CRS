import 'package:flutter/material.dart';
import 'package:CRS/service/constant.dart';

class Profile extends StatelessWidget {
  Profile({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.address,
    @required this.pincode,
    @required this.state,
    @required this.district,
    @required this.division,
    @required this.policestation,
  });
  final String name;
  final String email;
  final int phone;
  final String address;
  final int pincode;
  final String state;
  final String district;
  final String division;
  final String policestation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     "Profile",
      //     style: TextStyle(
      //       fontSize: 25.0,
      //       fontFamily: 'PTSans',
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                // CircleAvatar(
                //   radius: 65.0,
                //   backgroundColor: Colors.blue,
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 35.0,
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
                    color: Colors.teal[900],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.address_card,
                    //   color: Colors.black,
                    //   size: 38,
                    // ),
                    title: Text(
                      'Mobile No:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      '$phone',
                      style: profileBodyTextStyle,
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.address_card,
                    //   color: Colors.black,
                    //   size: 38,
                    // ),
                    title: Text(
                      'Address:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      address,
                      style: profileBodyTextStyle,
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.record_vinyl,
                    //   color: Colors.black,
                    // ),
                    title: Text(
                      'Pin Code:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      '$pincode',
                      style: profileBodyTextStyle,
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.universal_access,
                    //   color: Colors.black,
                    // ),
                    title: Text(
                      'State:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      state,
                      style: profileBodyTextStyle,
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.map_marker,
                    //   color: Colors.black,
                    // ),
                    title: Text(
                      'District:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      district,
                      style: profileBodyTextStyle,
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.map,
                    //   color: Colors.black,
                    // ),
                    title: Text(
                      'Division:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      division,
                      style: profileBodyTextStyle,
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    // leading: Icon(
                    //   LineAwesomeIcons.map,
                    //   color: Colors.black,
                    // ),
                    title: Text(
                      'Police Station:',
                      style: profileheadingTextStyle,
                    ),
                    subtitle: Text(
                      policestation,
                      style: profileBodyTextStyle,
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
