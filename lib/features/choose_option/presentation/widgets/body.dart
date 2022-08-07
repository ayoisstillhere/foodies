import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../login/presentation/login_cubit/login_cubit.dart';

import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../home_client/presentation/pages/home_client_screen.dart';
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
  String userClass = "";
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // BlocProvider.of<AuthCubit>(context).loggedIn();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HomeClientScreen(
                      uid: FirebaseAuth.instance.currentUser!.uid)));
        }
        if (state is LoginFailure) {
          addError(error: "Invalid Login");
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ChooseOptionForm();
      },
    );
  }

  Column ChooseOptionForm() {
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
                    userClass = "Partner";
                  });
                  removeError(error: kChooseOptionError);
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
                    userClass = "Client";
                  });
                  removeError(error: kChooseOptionError);
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
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(31)),
          child: FormError(errors: errors),
        ),
        DefaultButton(
            text: "Continue",
            press: _submitRegisteration,
            color: kSecondaryColor),
        const Spacer(),
      ],
    );
  }

  void _submitRegisteration() {
    if (userClass.isNotEmpty) {
      BlocProvider.of<LoginCubit>(context).submitRegisteration(
        email: widget.email,
        password: widget.password,
        firstName: widget.firstName,
        lastName: widget.lastName,
        userClass: userClass,
        hall: widget.hall,
        floor: widget.floor,
        wing: widget.wing,
        roomNo: widget.roomNo,
      );
    } else {
      addError(error: kChooseOptionError);
    }
  }
}
