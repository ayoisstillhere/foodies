import 'package:flutter/material.dart';
import 'package:foodies/features/login/presentation/pages/login_screen.dart';

import 'features/onboarding/presentation/pages/onboarding_screen.dart';

// in order to use named routes
// all routes wull be made available here
final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
};
