import 'package:flutter/material.dart';

import '../widgets/body.dart';

class HomeClientScreen extends StatelessWidget {
  static String routeName = "/home_client";
  final String uid;
  const HomeClientScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(uid: uid),
    );
  }
}
