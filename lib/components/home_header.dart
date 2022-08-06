
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
