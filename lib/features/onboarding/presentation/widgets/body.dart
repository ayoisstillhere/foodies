import 'package:flutter/material.dart';
import '../../../login/presentation/pages/login_screen.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'onboarding_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding1.jpg",
      "header": " Join as a Partner",
      "text": "Help your floormates get food while you’re on your way to CAFE.",
    },
    {
      "image": "assets/images/onboarding2.jpg",
      "header": " Join as a Client",
      "text":
          "Connect with floormates on their way to CAFE and get help to get chow.",
    },
    {
      "image": "assets/images/onboarding3.jpg",
      "header": " Welcome Foodies!",
      "text": "Let’s work toether and reduce those ridicuous crowds in CAFE.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: ((context, index) => OnboardingContent(
                  image: onboardingData[index]["image"],
                  header: onboardingData[index]["header"],
                  text: onboardingData[index]["text"],
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dot(0),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  dot(1),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  dot(2),
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
                press: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                color: Colors.white,
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ],
    );
  }

  Container dot(int index) {
    return Container(
      height: getProportionateScreenHeight(10),
      width: getProportionateScreenWidth(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: currentPage == index ? kPrimaryColor : kObjectGreyColor,
      ),
    );
  }
}
