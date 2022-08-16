import 'package:flutter/material.dart';

import 'package:foodies/components/default_button.dart';
import 'package:foodies/components/form_header.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/features/add_order/domain/entities/order_entity.dart';
import 'package:foodies/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.order,
    required this.btnAction,
  }) : super(key: key);
  final OrderEntity order;
  final String btnAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          const Center(
            child: FormHeader(
              title: "Order Details",
              subTitle: "",
            ),
          ),
          buildRow("Name", order.name),
          const Spacer(),
          buildRow("Room", order.room),
          const Spacer(),
          buildRow("Food", order.food),
          const Spacer(),
          buildRow("Location", order.location),
          const Spacer(),
          buildRow("Amount", "#${order.amount}"),
          const Spacer(),
          buildDetailsRow(),
          const Spacer(),
          DefaultButton(
            text: "$btnAction Order",
            press: () {},
            color: kSecondaryColor,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Padding buildDetailsRow() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(31)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(21)),
            alignment: Alignment.topLeft,
            height: getProportionateScreenHeight(134),
            width: getProportionateScreenWidth(225),
            decoration: BoxDecoration(
              color: kObjectGreyColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(20))),
            ),
            child: Text(
              order.details,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildRow(String key, String value) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(31)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(21)),
            alignment: Alignment.centerLeft,
            height: getProportionateScreenHeight(35),
            width: getProportionateScreenWidth(225),
            decoration: BoxDecoration(
              color: kObjectGreyColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(20))),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
