import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../components/default_button.dart';
import '../../../../components/home_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';

class HomeClientScreen extends StatelessWidget {
  static String routeName = "/home_client";
  final String uid;
  const HomeClientScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            Center(
              child: DefaultButton(
                text: "SignOut",
                press: () {
                  auth.signOut();
                  Navigator.pushNamed(context, OnboardingScreen.routeName);
                },
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
