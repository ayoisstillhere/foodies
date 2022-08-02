import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodies/components/default_button.dart';
import 'package:foodies/components/form_header.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

import 'option_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: FormHeader(
            title: "Partner or Client?",
            subTitle: "You can either post orders, or help others get chow!",
          ),
        ),
        const Spacer(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(31)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OptionCard(
                option: 'Partner',
                img: 'assets/images/choose_option_partner.svg',
                description: 'Help your floormates get food!',
                positions: [34, 46, 119, 34, 148, 15, 117],
              ),
              OptionCard(
                img: 'assets/images/choose_option_client.svg',
                option: 'Client',
                description: 'Post orders for floormates to help!',
                positions: [50, 35, 119, 43, 148, 5, 135],
              ),
            ],
          ),
        ),
        const Spacer(flex: 2),
        DefaultButton(text: "Continue", press: () {}, color: kSecondaryColor),
        const Spacer(),
      ],
    );
  }
}
