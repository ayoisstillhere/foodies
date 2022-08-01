import 'package:flutter/material.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'routes.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodies',
      theme: theme(),
      initialRoute: OnboardingScreen.routeName,
      routes: routes,
    );
  }
}
