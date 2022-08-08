import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../home_client/presentation/pages/home_client_screen.dart';
import '../../../signup/presentation/pages/signup_screen.dart';
import '../login_cubit/login_cubit.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final List<String> errors = [];

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // BlocProvider.of<AuthCubit>(context).loggedIn();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HomeClientScreen(
                      uid: FirebaseAuth.instance.currentUser!.uid)));
        }
        if (state is LoginFailure) {
          addError(error: "Invalid Login");
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return loginForm(context);
      },
    );
  }

  Form loginForm(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Center(
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(31)),
              child: FormError(errors: errors),
            ),
            DefaultButton(
              text: "Login",
              press: _submitLogin,
              color: kSecondaryColor,
            ),
            const Spacer(),
            buildSignUpText(() {
              Navigator.pushNamed(context, SignupScreen.routeName);
            }),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  Row buildSignUpText(void Function() press) {
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
        GestureDetector(
          onTap: press,
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: getProportionateScreenWidth(16),
            ),
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

  void _submitLogin() async {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      await BlocProvider.of<LoginCubit>(context).submitLogin(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }
}
