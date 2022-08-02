import 'package:flutter/material.dart';

import '../widgets/body.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = "/signup";
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: const Body(),
    );
  }
}
