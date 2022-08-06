import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:foodies/features/login/presentation/login_cubit/login_cubit.dart';

import '../../../../components/default_button.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'option_card.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.hall,
    required this.floor,
    required this.wing,
    required this.roomNo,
  }) : super(key: key);
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String hall;
  final String floor;
  final String wing;
  final String roomNo;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool partnerSelected = false;
  bool clientSelected = false;
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
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    partnerSelected = true;
                    clientSelected = false;
                  });
                },
                child: OptionCard(
                  option: 'Partner',
                  img: 'assets/images/choose_option_partner.svg',
                  description: 'Help your floormates get food!',
                  positions: [34, 46, 119, 34, 148, 15, 117],
                  isSelected: partnerSelected,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    clientSelected = true;
                    partnerSelected = false;
                  });
                },
                child: OptionCard(
                  img: 'assets/images/choose_option_client.svg',
                  option: 'Client',
                  description: 'Post orders for floormates to help!',
                  positions: [50, 35, 119, 43, 148, 5, 135],
                  isSelected: clientSelected,
                ),
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

  void _submitRegisteration() {
    BlocProvider.of<LoginCubit>(context).submitRegisteration(email: widget.email, password: widget., firstName: firstName, lastName: lastName, userClass: userClass, hall: hall, floor: floor, wing: wing, roomNo: roomNo)
  }
}
