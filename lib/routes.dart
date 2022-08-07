import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home_client/presentation/pages/home_client_screen.dart';
import 'features/login/presentation/pages/login_screen.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'features/signup/presentation/auth_bloc/auth_cubit.dart';
import 'features/signup/presentation/pages/signup_screen.dart';
import 'size_config.dart';

// in order to use named routes
// all routes wull be made available here
final Map<String, WidgetBuilder> routes = {
  "/": (context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
      SizeConfig().init(context);
        if (authState is Authenticated) {
          return HomeClientScreen(uid: authState.uid);
        }
        if (authState is UnAuthenticated) {
          return const OnboardingScreen();
        }
        return Container();
      },
    );
  },
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  // CompleteDetailsScreen.routeName: (context) => const CompleteDetailsScreen(),
  // ChooseOptionScreen.routeName: (context) => const ChooseOptionScreen(),
  // HomeClientScreen.routeName: (context) => const HomeClientScreen(uid: ,),
};
