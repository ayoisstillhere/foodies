import 'package:flutter/material.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

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
              FormHeader(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(31.0),
                ),
                child: SizedBox(
                  height: getProportionateScreenHeight(50),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: CustomSuffixIcon(
                        svgIcon: 'assets/icons/email_icon.svg',
                      ),
                    ),
                  ),
                ),
              ),
              DefaultButton(text: "Login", press: () {}, color: kSecondaryColor)
            ],
          ),
        ),
      ],
    );
  }
}

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(180),
      child: Text(
        "Sign In with your email and password",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: kTextGreyColor,
        ),
      ),
    );
  }
}
