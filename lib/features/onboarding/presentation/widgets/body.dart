import 'package:flutter/material.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(489),
          width: double.infinity,
          child: Image.asset(
            "assets/images/onboarding1.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Join as a Partner",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(32),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(247),
          child: Text(
            "Help your floormates get food while on your way to CAFE.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextGreyColor,
              fontSize: getProportionateScreenWidth(14),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dot(),
            SizedBox(width: getProportionateScreenWidth(20)),
            dot(),
            SizedBox(width: getProportionateScreenWidth(20)),
            dot(),
          ],
        ),
        DefaultButton(
          color: kSecondaryColor,
          text: 'Create Account',
          press: () {},
        ),
        DefaultButton(text: 'Login', press: () {}, color: Colors.white)
      ],
    );
  }

  Container dot() {
    return Container(
      height: getProportionateScreenHeight(10),
      width: getProportionateScreenWidth(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kPrimaryColor,
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
  }) : super(key: key);
  final String text;
  final void Function() press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31.0),
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: TextButton(
          onPressed: press,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: color == Colors.white
                    ? const BorderSide(
                        color: kTextGreyColor,
                      )
                    : BorderSide.none,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: color == Colors.white ? kPrimaryColor : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
