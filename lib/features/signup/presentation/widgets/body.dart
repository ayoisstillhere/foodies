import 'package:flutter/material.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../complete_details/presentation/pages/complete_details_screen.dart';
import '../../../login/presentation/pages/login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _signupFormKey = GlobalKey<FormState>();
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
    return Form(
      key: _signupFormKey,
      child: Center(
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(31)),
              child: FormError(errors: errors),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_signupFormKey.currentState!.validate()) {
                  _signupFormKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CompleteDetailsScreen(
                        firstName: _firstNameController.text.trim(),
                        lastName: _lastNameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    ),
                  );
                }
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
      child: TextFormField(
        onChanged: ((value) {
          if (value == _passwordController.text.trim()) {
            removeError(error: kMatchPassError);
          }
        }),
        validator: (value) {
          if (value != _passwordController.text.trim()) {
            addError(error: kMatchPassError);
            return "";
          }
          return null;
        },
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
    );
  }

  Padding buildPasswordFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          }
          if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
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
    );
  }

  Padding buildEmailFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: ((value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          }
          if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
        }),
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
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
    );
  }

  Padding buildFirstNameFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kFirstNameNullError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kFirstNameNullError);
            return "";
          }
          return null;
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
    );
  }

  Padding buildLastNameFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kLastNameNullError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kLastNameNullError);
            return "";
          }
          return null;
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
    );
  }
}
