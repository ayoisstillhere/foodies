import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(24),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(17),
        ),
        SizedBox(
          width: getProportionateScreenWidth(216),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              color: kTextGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
