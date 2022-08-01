import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {Key? key, required this.image, required this.header, required this.text})
      : super(key: key);
  final String image, header, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        onboardingImage(image),
        const Spacer(flex: 2),
        Text(
          header,
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
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextGreyColor,
              fontSize: getProportionateScreenWidth(14),
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

SizedBox onboardingImage(String image) {
  return SizedBox(
    height: getProportionateScreenHeight(489),
    width: double.infinity,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );
}
