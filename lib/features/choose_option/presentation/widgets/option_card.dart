import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.img,
    required this.option,
    required this.description,
    required this.positions,
  }) : super(key: key);
  final String img;
  final String option;
  final String description;
  final List<double> positions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(209),
          width: getProportionateScreenWidth(145),
          decoration: const BoxDecoration(
            color: kObjectGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(36),
          left: getProportionateScreenWidth(39),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: getProportionateScreenHeight(35),
          ),
        ),
        Positioned(
          top: getProportionateScreenWidth(positions[0]),
          left: getProportionateScreenHeight(positions[1]),
          child: SvgPicture.asset(img),
        ),
        Positioned(
          top: getProportionateScreenHeight(positions[2]),
          left: getProportionateScreenWidth(positions[3]),
          child: Text(
            option,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(positions[4]),
          left: getProportionateScreenWidth(positions[5]),
          child: SizedBox(
            width: getProportionateScreenWidth(positions[6]),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
