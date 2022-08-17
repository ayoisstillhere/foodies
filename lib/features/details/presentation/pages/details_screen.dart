import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/default_button.dart';
import '../../../../components/form_header.dart';
import '../../../../constants.dart';
import '../../../add_order/domain/entities/order_entity.dart';
import '../../../add_order/presentation/bloc/cubit/order_cubit.dart';
import '../../../../size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.order,
    required this.btnAction,
    required this.uid,
  }) : super(key: key);
  final OrderEntity order;
  final String btnAction;
  final String uid;

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
            press: () {
              if (btnAction == 'Delete') {
                BlocProvider.of<OrderCubit>(context).deleteOrer(order.orderId);
              } else if (btnAction == 'Select') {
                BlocProvider.of<OrderCubit>(context).selectOrder(
                  order.orderId,
                  uid,
                );
              } else if (btnAction == 'Unselect') {
                BlocProvider.of<OrderCubit>(context)
                    .unselectOrder(order.orderId);
              }
              Navigator.pop(context);
            },
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
