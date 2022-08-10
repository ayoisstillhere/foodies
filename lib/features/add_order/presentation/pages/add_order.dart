import 'package:flutter/material.dart';

import '../widgets/body.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Order"),
      ),
      body: Body(),
    );
  }
}
