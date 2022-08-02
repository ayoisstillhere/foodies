import 'package:flutter/material.dart';
import 'package:foodies/components/default_button.dart';
import 'package:foodies/features/choose_option/presentation/pages/choose_option_screen.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static const hallValues = <String>[
    'John',
    'Joseph',
    'Daniel',
    'Mary',
    'Dorcas',
    'Deborah',
    'Lydia',
    'Esther',
    'Paul',
    'Peter'
  ];

  String selectedHall = hallValues.first;

  static const floorValues = <String>[
    '100',
    '200',
    '300',
    '400',
  ];

  String selectedFloor = floorValues.first;

  static const wingValues = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
  ];

  String selectedWing = wingValues.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: FormHeader(
            title: "Complete Profile",
            subTitle: "Enter your room details so we can get you some chow!",
          ),
        ),
        const Spacer(),
        sectionTitle("Hall"),
        buildHallRadios(),
        const Spacer(),
        sectionTitle("Floor"),
        buildFloorRadios(),
        const Spacer(),
        sectionTitle("Wing"),
        buildWingRadios(),
        const Spacer(),
        sectionTitle("Room No."),
        const Spacer(),
        buildRoomNoField(),
        const Spacer(
          flex: 4,
        ),
        DefaultButton(
          text: "Sign Up",
          press: () {
            Navigator.pushNamed(context, ChooseOptionScreen.routeName);
          },
          color: kSecondaryColor,
        ),
        const Spacer(flex: 4),
      ],
    );
  }

  Padding buildRoomNoField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: "Room Number",
            hintText: "E.g H304",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/number_icon.svg',
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Text(
        title,
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(20),
        ),
      ),
    );
  }

  Widget buildHallRadios() => Wrap(
        children: hallValues.map(
          (value) {
            return Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<String>(
                    activeColor: kSecondaryColor,
                    value: value,
                    groupValue: selectedHall,
                    onChanged: (value) => setState(
                      () {
                        selectedHall = value!;
                      },
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                        color: kTextGreyColor,
                        fontSize: getProportionateScreenWidth(18)),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      );

  Widget buildFloorRadios() => Wrap(
        children: floorValues.map((value) {
          return Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  activeColor: kSecondaryColor,
                  value: value,
                  groupValue: selectedFloor,
                  onChanged: (value) => setState(
                    () {
                      selectedFloor = value!;
                    },
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: kTextGreyColor,
                      fontSize: getProportionateScreenWidth(18)),
                ),
              ],
            ),
          );
        }).toList(),
      );

  Widget buildWingRadios() => Wrap(
        children: wingValues.map((value) {
          return Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  activeColor: kSecondaryColor,
                  value: value,
                  groupValue: selectedWing,
                  onChanged: (value) => setState(
                    () {
                      selectedWing = value!;
                    },
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: kTextGreyColor,
                      fontSize: getProportionateScreenWidth(18)),
                ),
              ],
            ),
          );
        }).toList(),
      );
}
