import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage(
      {@required this.hintText,
      @required this.onTap,
      this.secure,
      this.lineHeight});
  final String hintText;
  final Function onTap;
  final bool secure;
  final int lineHeight;
  @override
  _TextFieldPageState createState() => _TextFieldPageState(
      hintText: hintText, onTap: onTap, secure: secure, lineHeight: lineHeight);
}

class _TextFieldPageState extends State<TextFieldPage> {
  _TextFieldPageState(
      {@required this.hintText,
      @required this.onTap,
      this.secure,
      this.lineHeight});
  final String hintText;
  final Function onTap;
  final bool secure;
  final int lineHeight;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      onChanged: onTap,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      obscureText: secure,
      maxLines: lineHeight,
    );
  }
}
