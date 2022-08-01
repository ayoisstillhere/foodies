import 'package:flutter/material.dart';
import 'package:foodies/features/login/presentation/widgets/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: const Body(),
    );
  }
}
