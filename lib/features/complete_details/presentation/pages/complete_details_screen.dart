import 'package:flutter/material.dart';

import '../widgets/body.dart';

class CompleteDetailsScreen extends StatelessWidget {
  static String routeName = "/complete_details";
  const CompleteDetailsScreen({Key? key}) : super(key: key);

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
