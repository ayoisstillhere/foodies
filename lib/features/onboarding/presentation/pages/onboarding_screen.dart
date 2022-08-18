import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../widgets/body.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Has to Be called on Starting Screen
    SizeConfig().init(context);
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
