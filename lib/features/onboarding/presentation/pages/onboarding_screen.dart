import 'package:flutter/material.dart';

import '../widgets/body.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
