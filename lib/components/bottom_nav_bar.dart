
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/orders/presentation/pages/orders_screen.dart';
import '../features/profile/presentation/pages/profile_screen.dart';
import '../size_config.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selected,
    required this.uid,
  }) : super(key: key);
  final int selected;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31),
      ).copyWith(bottom: getProportionateScreenHeight(33)),
      child: Container(
        height: getProportionateScreenHeight(71),
        width: getProportionateScreenWidth(328),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen(uid: uid)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/home_icon.svg",
                      color: selected == 0 ? kSecondaryColor : kTextGreyColor,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        color: selected == 0 ? kSecondaryColor : kTextGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => OrdersScreen(uid: uid)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/order_icon.svg",
                      color: selected == 1 ? kSecondaryColor : kTextGreyColor,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        color: selected == 1 ? kSecondaryColor : kTextGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProfileScreen(uid: uid)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/profile_icon.svg",
                      color: selected == 2 ? kSecondaryColor : kTextGreyColor,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        color: selected == 2 ? kSecondaryColor : kTextGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
