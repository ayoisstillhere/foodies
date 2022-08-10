import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: ,
    appBarTheme: appBarTheme(),
    // textTheme: ,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: const IconThemeData(color: kTextGreyColor),
    titleTextStyle: TextStyle(
      color: kTextGreyColor,
      fontSize: 18,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: kTextGreyColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // Floating label behavior doesnt work in this theme
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 30,
      // vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    hintStyle: TextStyle(
      color: kTextGreyColor,
      fontSize: 20,
    ),
    labelStyle: TextStyle(
      color: kTextGreyColor,
    ),
  );
}
