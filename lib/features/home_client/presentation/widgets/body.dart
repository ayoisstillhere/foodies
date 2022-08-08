import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodies/features/home_client/presentation/user_bloc/user_cubit.dart';
import 'package:foodies/features/signup/data/models/user_model.dart';
import 'package:foodies/size_config.dart';

import '../../../../components/default_button.dart';
import '../../../../components/home_header.dart';
import '../../../../constants.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserLoaded) {
          return homeBody(auth, state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  SingleChildScrollView homeBody(FirebaseAuth auth, UserLoaded users) {
    final user = users.users.firstWhere(
      (user) => user.uid == widget.uid,
      orElse: () => const UserModel(
          email: "",
          firstName: "",
          lastName: "",
          uid: "",
          userClass: "",
          hall: "",
          floor: "",
          wing: "",
          roomNo: ""),
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(firstName: user.firstName),
          SizedBox(height: getProportionateScreenHeight(40)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(31)),
            child: Text(
              "Available Partners:",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(22),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          PartnerTile(),
          PartnerTile(),
          PartnerTile(),
          Center(
            child: DefaultButton(
              text: "SignOut",
              press: () {
                auth.signOut();
                Navigator.pushNamed(context, OnboardingScreen.routeName);
              },
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PartnerTile extends StatelessWidget {
  const PartnerTile({
    Key? key,
  }) : super(key: key);

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
                    text: 'George Ajayi,\n',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'H304',
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
        SizedBox(height: getProportionateScreenHeight(35)),
      ],
    );
  }
}
