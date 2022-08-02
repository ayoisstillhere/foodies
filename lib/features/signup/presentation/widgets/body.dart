import 'package:flutter/material.dart';
import 'package:foodies/components/default_button.dart';
import 'package:foodies/components/form_header.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/features/complete_details/presentation/pages/complete_details_screen.dart';
import 'package:foodies/features/login/presentation/pages/login_screen.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const FormHeader(
            title: "Complete Profile",
            subTitle: "Complete your details and move on to the next step",
          ),
          const Spacer(),
          buildFirstNameFormField(),
          const Spacer(),
          buildLastNameFormField(),
          const Spacer(),
          buildEmailFormField(),
          const Spacer(),
          buildPasswordFormField(),
          const Spacer(),
          buildConfirmPasswordFormField(),
          const Spacer(),
          DefaultButton(
            text: "Continue",
            press: () {
              Navigator.pushNamed(context, CompleteDetailsScreen.routeName);
            },
            color: kSecondaryColor,
          ),
          const Spacer(),
          buildLoginText(() {
            Navigator.pushNamed(context, LoginScreen.routeName);
          }),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Row buildLoginText(void Function() press) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ? ",
          style: TextStyle(
            color: kTextGreyColor,
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Login",
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildConfirmPasswordFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Confirm Password",
            hintText: "Confirm your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/password_icon.svg',
            ),
          ),
        ),
      ),
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
          obscureText: true,
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

  Padding buildFirstNameFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: "First name",
            hintText: "Enter your first name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/user_icon.svg',
            ),
          ),
        ),
      ),
    );
  }

  Padding buildLastNameFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: "Last name",
            hintText: "Enter your last name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/user_icon.svg',
            ),
          ),
        ),
      ),
    );
  }
}
