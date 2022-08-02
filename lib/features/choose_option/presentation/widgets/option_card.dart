import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    Key? key,
    required this.img,
    required this.option,
    required this.description,
    required this.positions,
    required this.isSelected,
  }) : super(key: key);
  final String img;
  final String option;
  final String description;
  final List<double> positions;
  final bool isSelected;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(209),
          width: getProportionateScreenWidth(145),
          decoration: BoxDecoration(
            color: widget.isSelected ? kSecondaryColor : kObjectGreyColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(36),
          left: getProportionateScreenWidth(39),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: getProportionateScreenHeight(35),
          ),
        ),
        Positioned(
          top: getProportionateScreenWidth(widget.positions[0]),
          left: getProportionateScreenHeight(widget.positions[1]),
          child: SvgPicture.asset(widget.img),
        ),
        Positioned(
          top: getProportionateScreenHeight(widget.positions[2]),
          left: getProportionateScreenWidth(widget.positions[3]),
          child: Text(
            widget.option,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(widget.positions[4]),
          left: getProportionateScreenWidth(widget.positions[5]),
          child: SizedBox(
            width: getProportionateScreenWidth(widget.positions[6]),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
