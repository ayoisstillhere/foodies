import 'package:flutter/material.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const FormHeader(
            title: 'Welcome Back',
            subTitle: 'Sign In with your email and password',
          ),
          const Spacer(flex: 2),
          buildEmailFormField(),
          const Spacer(),
          buildPasswordFormField(),
          const Spacer(flex: 2),
          DefaultButton(
            text: "Login",
            press: () {},
            color: kSecondaryColor,
          ),
          const Spacer(),
          buildSignUpText(),
          const Spacer(flex: 5),
        ],
      ),
    );
  }

  Row buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: kTextGreyColor,
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        Text(
          "Sign Up",
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
      ],
    );
  }

  Padding buildPasswordFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/password_icon.svg',
            ),
          ),
        ),
      ),
    );
  }

  Padding buildEmailFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/email_icon.svg',
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(24),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(17),
        ),
        SizedBox(
          width: getProportionateScreenWidth(180),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              color: kTextGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
