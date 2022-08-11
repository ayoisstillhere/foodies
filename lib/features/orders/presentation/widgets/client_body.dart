import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodies/constants.dart';

import '../../../../components/form_header.dart';
import '../../../../size_config.dart';

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
            const FormHeader(
              title: "Your Orders",
              subTitle: "Tap Orders for Details",
            ),
            FoodTile(),
          ],
        ),
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  const FoodTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          width: getProportionateScreenWidth(328),
          decoration: BoxDecoration(
            color: kObjectGreyColor,
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(20))),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(10),
          left: getProportionateScreenWidth(10),
          child: CircleAvatar(
            radius: getProportionateScreenHeight(40),
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(12),
          left: getProportionateScreenWidth(17),
          child: SvgPicture.asset("assets/images/food_icon1.svg"),
        ),
        Positioned(
          top: getProportionateScreenHeight(28),
          left: getProportionateScreenWidth(105),
          child: RichText(
            text: TextSpan(
              text: "Chicken and Chips\n",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(18),
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "CAFE 2  ",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(14),
                    )),
                TextSpan(
                  text: "#1200",
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
