import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class PartnerTile extends StatelessWidget {
  const PartnerTile({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.roomNo,
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String roomNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(31)),
          child: Stack(
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
                top: getProportionateScreenHeight(10),
                left: getProportionateScreenWidth(17),
                child: SvgPicture.asset("assets/images/available_partners.svg"),
              ),
              Positioned(
                top: getProportionateScreenHeight(26),
                left: getProportionateScreenWidth(102),
                child: RichText(
                  text: TextSpan(
                    text: '$firstName $lastName,\n',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: roomNo,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
