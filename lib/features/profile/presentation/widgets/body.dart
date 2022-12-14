import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../home/presentation/bloc/user_bloc/user_cubit.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../login/presentation/login_cubit/login_cubit.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';
import '../../../signup/presentation/auth_bloc/auth_cubit.dart';
import '../../../../size_config.dart';

import '../../../choose_option/presentation/widgets/option_card.dart';
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
  bool isSelected = false;
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
          const Spacer(flex: 2),
          Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(25),
            ),
          ),
          const Spacer(),
          Text(
            user.roomNo,
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          const Spacer(flex: 2),
          user.userClass == 'Client'
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: OptionCard(
                    option: 'Partner',
                    img: 'assets/images/choose_option_partner.svg',
                    description: 'Help your floormates get food!',
                    positions: const [34, 46, 119, 34, 148, 15, 117],
                    isSelected: isSelected,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: OptionCard(
                    img: 'assets/images/choose_option_client.svg',
                    option: 'Client',
                    description: 'Post orders for floormates to help!',
                    positions: const [50, 35, 119, 43, 148, 5, 135],
                    isSelected: isSelected,
                  ),
                ),
          const Spacer(flex: 2),
          DefaultButton(
            text: user.userClass == "Client"
                ? "Switch to Partner"
                : "Switch to Client",
            press: () {
              BlocProvider.of<LoginCubit>(context)
                  .switchClass(userClass: user.userClass, uid: user.uid);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HomeScreen(uid: user.uid)));
            },
            color: Colors.white,
          ),
          const Spacer(flex: 2),
          DefaultButton(
            text: "Sign Out",
            press: () {
              BlocProvider.of<AuthCubit>(context).loggedOut();
              BlocProvider.of<LoginCubit>(context).submitSignOut();
              Navigator.pushNamed(context, OnboardingScreen.routeName);
            },
            color: kSecondaryColor,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
