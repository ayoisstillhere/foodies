import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodies/components/form_header.dart';

import 'package:foodies/features/signup/domain/entities/user_entity.dart';

import '../../../../components/default_button.dart';
import '../../../../components/home_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';
import '../../../signup/data/models/user_model.dart';
import '../bloc/user_bloc/user_cubit.dart';
import 'partner_tile.dart';

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

  Widget homeBody(FirebaseAuth auth, UserLoaded users) {
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
    final List<UserEntity> partners = [];
    for (var i = 0; i < users.users.length; i++) {
      if (users.users[i].hall == user.hall &&
          users.users[i].wing == user.wing &&
          users.users[i].floor == user.floor &&
          users.users[i].userClass == "Partner") {
        partners.add(users.users[i]);
      }
    }
    if (user.userClass == "Client") {
      return ClientBody(user: user, partners: partners);
    } else {
      return PartnerBody(user: user);
    }
  }
}

class ClientBody extends StatelessWidget {
  const ClientBody({
    Key? key,
    required this.user,
    required this.partners,
  }) : super(key: key);

  final UserEntity user;
  final List<UserEntity> partners;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: partners.length,
            itemBuilder: (BuildContext context, int index) {
              return PartnerTile(
                firstName: partners[index].firstName,
                lastName: partners[index].lastName,
                roomNo: partners[index].roomNo,
              );
            },
          ),
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

class PartnerBody extends StatelessWidget {
  const PartnerBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(firstName: user.firstName),
          SizedBox(height: getProportionateScreenHeight(40)),
          const Center(
            child: FormHeader(
              title: "Selected Orders",
              subTitle: "Tap Orders for Details",
            ),
          ),
          // Center(
          //   child: DefaultButton(
          //     text: "SignOut",
          //     press: () {
          //       auth.signOut();
          //       Navigator.pushNamed(context, OnboardingScreen.routeName);
          //     },
          //     color: kSecondaryColor,
          //   ),
          // ),
        ],
      ),
    );
  }
}
