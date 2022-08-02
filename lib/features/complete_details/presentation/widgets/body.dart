import 'package:flutter/material.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

import '../../../../components/form_header.dart';

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
        sectionTitle("Hall"),
        buildHallRadios(),
        sectionTitle("Floor"),
        buildFloorRadios(),
        sectionTitle("Wing"),
        buildWingRadios(),
        sectionTitle("Room No."),
      ],
    );
  }

  Text sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: getProportionateScreenWidth(20),
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
