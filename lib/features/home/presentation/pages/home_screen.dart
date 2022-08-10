import 'package:flutter/material.dart';

import '../../../../components/bottom_nav_bar.dart';
import '../widgets/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home_client";
  final String uid;
  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(uid: uid),
      bottomNavigationBar: BottomNavBar(selected: 0, uid: uid),
    );
  }
}
