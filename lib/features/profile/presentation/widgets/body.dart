import 'package:flutter/material.dart';
import 'package:foodies/components/form_header.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const FormHeader(
            title: "Your Profile",
            subTitle: "You can switch to be a partner from here.",
          ),
          Text(
            "Ayodele Fagbami",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(25),
            ),
          ),
          Text(
            "H304",
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
        ],
      ),
    );
  }
}
