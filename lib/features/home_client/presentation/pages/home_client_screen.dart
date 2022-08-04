import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies/components/default_button.dart';
import 'package:foodies/constants.dart';

import '../../../../size_config.dart';

class HomeClientScreen extends StatelessWidget {
  static String routeName = "/home_client";
  final String uid;
  const HomeClientScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: DefaultButton(
          text: "SignOut",
          press: () {
            auth.signOut();
          },
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
