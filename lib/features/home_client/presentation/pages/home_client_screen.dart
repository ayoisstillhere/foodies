import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies/components/default_button.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/features/onboarding/presentation/pages/onboarding_screen.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: getProportionateScreenHeight(186),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(31)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(54)),
                    SizedBox(
                      height: getProportionateScreenHeight(51.44),
                      width: getProportionateScreenWidth(220),
                      child: Image.asset("assets/images/Logo_Name.png"),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      "Welcome, Ayodele!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(24)),
                    ),
                  ],
                ),
              ),
            ),
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
