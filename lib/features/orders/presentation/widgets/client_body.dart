import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:foodies/constants.dart';
import 'package:foodies/features/add_order/domain/entities/order_entity.dart';
import 'package:foodies/features/add_order/presentation/bloc/cubit/order_cubit.dart';

import '../../../../components/form_header.dart';
import '../../../../size_config.dart';

class ClientBody extends StatefulWidget {
  const ClientBody({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<ClientBody> createState() => _ClientBodyState();
}

class _ClientBodyState extends State<ClientBody> {
  @override
  void initState() {
    BlocProvider.of<OrderCubit>(context).getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (_, state) {
        if (state is OrderLoaded) {
          return orderBody(state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget orderBody(OrderLoaded orders) {
    final List<OrderEntity> yourOrders = [];
    for (var i = 0; i < orders.orders.length; i++) {
      if (orders.orders[i].uid == widget.uid) {
        yourOrders.add(orders.orders[i]);
      }
    }
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            const FormHeader(
              title: "Your Orders",
              subTitle: "Tap Orders for Details",
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(31))
                  .copyWith(top: getProportionateScreenHeight(40)),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: yourOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      FoodTile(
                        food: yourOrders[index].food,
                        location: yourOrders[index].location,
                        ammount: yourOrders[index].amount,
                        index: index,
                      ),
                      SizedBox(height: getProportionateScreenHeight(45)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  const FoodTile({
    Key? key,
    required this.food,
    required this.location,
    required this.ammount,
    required this.index,
  }) : super(key: key);
  final String food;
  final String location;
  final String ammount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          width: getProportionateScreenWidth(328),
          decoration: BoxDecoration(
            color: kObjectGreyColor,
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(20))),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(10),
          left: getProportionateScreenWidth(10),
          child: CircleAvatar(
            radius: getProportionateScreenHeight(40),
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(12),
          left: getProportionateScreenWidth(17),
          child: index.isEven
              ? SvgPicture.asset("assets/images/food_icon1.svg")
              : SvgPicture.asset("assets/images/food_icon2.svg"),
        ),
        Positioned(
          top: getProportionateScreenHeight(28),
          left: getProportionateScreenWidth(105),
          child: RichText(
            text: TextSpan(
              text: "$food\n",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(18),
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "$location  ",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(14),
                    )),
                TextSpan(
                  text: "#$ammount",
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
