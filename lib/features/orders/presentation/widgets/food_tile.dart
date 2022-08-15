import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    Key? key,
    required this.food,
    required this.location,
    required this.ammount,
    required this.index,
  }) : super(key: key);
  final String food;
  final String location;
  final String ammount;
  final int index;

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
          child: index.isEven
              ? SvgPicture.asset("assets/images/food_icon1.svg")
              : SvgPicture.asset("assets/images/food_icon2.svg"),
        ),
        Positioned(
          top: getProportionateScreenHeight(28),
          left: getProportionateScreenWidth(105),
          child: RichText(
            text: TextSpan(
              text: "$food\n",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(18),
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "$location  ",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(14),
                    )),
                TextSpan(
                  text: "#$ammount",
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
