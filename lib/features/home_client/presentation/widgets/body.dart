import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/features/home_client/presentation/user_bloc/user_cubit.dart';
import 'package:foodies/features/signup/data/models/user_model.dart';

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
      orElse: () => UserModel(
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
        children: [
          HomeHeader(firstName: user.firstName),
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
