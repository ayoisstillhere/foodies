import 'package:flutter/material.dart';

class HomeClientScreen extends StatelessWidget {
  static String routeName = "/home_client";
  const HomeClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
