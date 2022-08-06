import 'package:flutter/material.dart';

import '../widgets/body.dart';

class ChooseOptionScreen extends StatelessWidget {
  static String routeName = "/chooseOption";
  const ChooseOptionScreen({
    Key? key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.hall,
    required this.floor,
    required this.wing,
    required this.roomNo,
  }) : super(key: key);
  final String email;
  final String firstName;
  final String lastName;
  final String hall;
  final String floor;
  final String wing;
  final String roomNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an Option"),
      ),
      body: Body(email: email, firstName: firstName, lastName: lastName, hall: hall, floor: floor, wing: wing, roomNo: roomNo),
    );
  }
}
