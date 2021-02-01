import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({
    @required this.name,
    @required this.email,
    @required this.role,
    @required this.token,
    @required this.id,
  });
  final String name;
  final String email;
  final String role;
  final String token;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(name),
          Text(email),
          Text(role),
          Text(token),
          Text(role),
          Text(id),
        ],
      ),
    );
  }
}
