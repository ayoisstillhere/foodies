import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../components/form_header.dart';

import '../../../signup/domain/entities/user_entity.dart';

import '../../../../components/default_button.dart';
import '../../../../components/home_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';
import '../../../signup/data/models/user_model.dart';
import '../bloc/user_bloc/user_cubit.dart';
import 'client_body.dart';
import 'partner_body.dart';
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
  final List<String> sameFloorUsers = [];
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserLoaded) {
          return homeBody(state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget homeBody(UserLoaded users) {
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
    for (var i = 0; i < users.users.length; i++) {
      if (users.users[i].hall == user.hall &&
          users.users[i].wing == user.wing &&
          users.users[i].floor == user.floor) {
        sameFloorUsers.add(users.users[i].uid);
      }
    }

    // Partners for Client Screen
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
      return PartnerBody(user: user, sameFloorUsers: sameFloorUsers,);
    }
  }
}

