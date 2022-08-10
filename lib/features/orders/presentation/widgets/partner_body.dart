import 'package:flutter/material.dart';

import '../../../../components/form_header.dart';

class PartnerBody extends StatelessWidget {
  const PartnerBody({
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
              title: "Orders",
              subTitle:
                  "These are your floor mates’ orders. Tap for details and to select them.",
            ),
          ],
        ),
      ),
    );
  }
}
