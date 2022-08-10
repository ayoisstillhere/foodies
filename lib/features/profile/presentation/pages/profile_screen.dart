import 'package:flutter/material.dart';
import '../../../../components/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      bottomNavigationBar: BottomNavBar(selected: 2, uid: uid),
    );
  }
}
