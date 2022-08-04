import 'package:flutter/material.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../complete_details/presentation/pages/complete_details_screen.dart';
import '../../../login/presentation/pages/login_screen.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final List<String> errors = [];

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

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
          onChanged: ((value) {
            if (value == _passwordController.text.trim()) {
              removeError(error: kMatchPassError);
            }
          }),
          controller: _confirmPasswordController,
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
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
          },
          controller: _passwordController,
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
          onChanged: ((value) {
            if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
          }),
          controller: _emailController,
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
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kFirstNameNullError);
            }
          },
          controller: _firstNameController,
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
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kLastNameNullError);
            }
          },
          controller: _lastNameController,
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
