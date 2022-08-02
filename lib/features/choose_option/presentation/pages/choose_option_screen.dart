import 'package:flutter/material.dart';

import '../widgets/body.dart';

class ChooseOptionScreen extends StatelessWidget {
  static String routeName = "/chooseOption";
  const ChooseOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an Option"),
      ),
      body: Body(),
    );
  }
}
