import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: ,
    appBarTheme: appBarTheme(),
    // textTheme: ,
    // inputDecorationTheme: ,
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
