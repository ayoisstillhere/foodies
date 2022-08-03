import 'package:flutter/material.dart';
import 'package:foodies/features/home_client/presentation/pages/home_client_screen.dart';
import 'features/choose_option/presentation/pages/choose_option_screen.dart';
import 'features/complete_details/presentation/pages/complete_details_screen.dart';
import 'features/login/presentation/pages/login_screen.dart';
import 'features/signup/presentation/pages/signup_screen.dart';

import 'features/onboarding/presentation/pages/onboarding_screen.dart';

// in order to use named routes
// all routes wull be made available here
final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  CompleteDetailsScreen.routeName: (context) => const CompleteDetailsScreen(),
  ChooseOptionScreen.routeName: (context) => const ChooseOptionScreen(),
  HomeClientScreen.routeName:(context) => const HomeClientScreen(),
};
