import 'package:flutter/material.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

import '../widgets/body.dart';

class HomeClientScreen extends StatelessWidget {
  static String routeName = "/home_client";
  final String uid;
  const HomeClientScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(uid: uid),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(31),
        ).copyWith(bottom: getProportionateScreenHeight(33)),
        child: Container(
          height: getProportionateScreenHeight(71),
          width: getProportionateScreenWidth(328),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
