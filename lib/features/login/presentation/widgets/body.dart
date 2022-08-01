import 'package:flutter/material.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(180),
                child: Text(
                  "Sign In with your email and password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: kTextGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
