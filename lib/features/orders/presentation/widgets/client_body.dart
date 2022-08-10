import 'package:flutter/material.dart';

import '../../../../components/form_header.dart';

class ClientBody extends StatelessWidget {
  const ClientBody({
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
