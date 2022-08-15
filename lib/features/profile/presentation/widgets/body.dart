import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/components/form_header.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/features/home/presentation/bloc/user_bloc/user_cubit.dart';
import 'package:foodies/size_config.dart';

import '../../../signup/data/models/user_model.dart';

class Body extends StatefulWidget {
  const Body({
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
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserLoaded) {
          return profileBody(state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Center profileBody(UserLoaded users) {
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
    return Center(
      child: Column(
        children: [
          const FormHeader(
            title: "Your Profile",
            subTitle: "You can switch to be a partner from here.",
          ),
          Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(25),
            ),
          ),
          Text(
            user.roomNo,
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
        ],
      ),
    );
  }
}
