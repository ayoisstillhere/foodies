import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'routes.dart';
import 'theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
