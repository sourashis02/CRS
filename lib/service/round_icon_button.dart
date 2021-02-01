import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.image, @required this.onTap});
  final String image;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Image.asset(image),
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(
        width: 150.0,
        height: 120.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
