import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  SideBarLayout({this.name, this.email, this.token});
  final String name;
  final String email;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(
              token: token,
              name: name,
              email: email,
            ),
          ],
        ),
      ),
    );
  }
}
