import 'package:flutter/material.dart';
import 'package:foodies/features/onboarding/presentation/widgets/onboarding_content.dart';

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
        const Expanded(
          flex: 5,
          child: OnboardingContent(
            image: "assets/images/onboarding1.jpg",
            header: "Join as a Partner",
            text: "Help your floormates get food while on your way to CAFE.",
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
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
              const Spacer(flex: 2),
              DefaultButton(
                color: kSecondaryColor,
                text: 'Create Account',
                press: () {},
              ),
              const Spacer(),
              DefaultButton(
                text: 'Login',
                press: () {},
                color: Colors.white,
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ],
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
