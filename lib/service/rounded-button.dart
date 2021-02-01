import 'package:flutter/material.dart';
import 'package:CRS/pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonName,
    @required this.ontap,
  }) : super(key: key);

  final String buttonName;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: hexToColor('#12375F'),
      ),
      child: FlatButton(
        onPressed: ontap,
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            height: 1.5,
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSans',
          ),
        ),
      ),
    );
  }
}
