import 'package:flutter/material.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        onboardingImage(),
        const Spacer(),
        Text(
          "Join as a Partner",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(32),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: getProportionateScreenWidth(247),
          child: Text(
            "Help your floormates get food while on your way to CAFE.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextGreyColor,
              fontSize: getProportionateScreenWidth(14),
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dot(),
            SizedBox(width: getProportionateScreenWidth(20)),
            dot(),
            SizedBox(width: getProportionateScreenWidth(20)),
            dot(),
          ],
        ),
        const Spacer(),
        DefaultButton(
          color: kSecondaryColor,
          text: 'Create Account',
          press: () {},
        ),
        const Spacer(),
        DefaultButton(text: 'Login', press: () {}, color: Colors.white),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }

  SizedBox onboardingImage() {
    return SizedBox(
      height: getProportionateScreenHeight(489),
      width: double.infinity,
      child: Image.asset(
        "assets/images/onboarding1.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Container dot() {
    return Container(
      height: getProportionateScreenHeight(10),
      width: getProportionateScreenWidth(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kPrimaryColor,
      ),
    );
  }
}
