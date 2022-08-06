import 'package:flutter/material.dart';

import '../widgets/body.dart';

class CompleteDetailsScreen extends StatelessWidget {
  static String routeName = "/complete_details";
  const CompleteDetailsScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Body(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      ),
    );
  }
}
