import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:foodies/constants.dart';
import 'package:foodies/features/add_order/domain/entities/order_entity.dart';
import 'package:foodies/features/add_order/presentation/bloc/cubit/order_cubit.dart';
import 'package:foodies/features/details/presentation/pages/details_screen.dart';

import '../../../../components/form_header.dart';
import '../../../../size_config.dart';
import 'food_tile.dart';

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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(
                                        order: yourOrders[index],
                                        btnAction: 'Delete',
                                      )));
                        },
                        child: FoodTile(
                          food: yourOrders[index].food,
                          location: yourOrders[index].location,
                          ammount: yourOrders[index].amount,
                          index: index,
                        ),
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
