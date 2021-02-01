import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle kBodyText = TextStyle(
    fontSize: 22, color: Colors.black, height: 1.5, fontFamily: 'PTSans');

const Color kWhite = Colors.white;
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

final Color kBlue = hexToColor('#12375F');
