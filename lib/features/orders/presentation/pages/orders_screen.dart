import 'package:flutter/material.dart';
import 'package:foodies/components/bottom_nav_bar.dart';

import '../widgets/body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Body(uid: uid),
      bottomNavigationBar: BottomNavBar(selected: 1, uid: uid),
    );
  }
}
