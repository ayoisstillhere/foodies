import 'package:flutter/material.dart';
import 'package:foodies/components/form_header.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            FormHeader(
              title: "Your Orders",
              subTitle: "Tap Orders for Details",
            ),
          ],
        ),
      ),
    );
  }
}
