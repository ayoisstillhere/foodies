import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF191919);
const kSecondaryColor = Color(0xFFF15025);
const kTextGreyColor = Color(0xFFCED0CE);
const kObjectGreyColor = Color(0xFFE6E8E6);

//Form Constants
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";
const String kRoomNoNullError = "Please Enter your Room Number";
const String kChooseOptionError = "Please Select an Option";
