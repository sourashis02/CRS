import 'package:CRS/service/constant.dart';
import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: basicTextStyle,
      ),
    );
  }
}
