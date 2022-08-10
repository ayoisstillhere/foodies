import 'package:flutter/material.dart';

import '../widgets/body.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({
    Key? key,
    required this.uid,
    required this.name,
    required this.room,
  }) : super(key: key);
  final String uid;
  final String name;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Order"),
      ),
      body: Body(uid: uid, name: name, room: room),
    );
  }
}
