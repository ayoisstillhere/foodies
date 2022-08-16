import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/features/add_order/domain/entities/order_entity.dart';

import 'package:foodies/features/add_order/presentation/bloc/cubit/order_cubit.dart';
import 'package:foodies/features/orders/presentation/widgets/partner_food_tile.dart';

import '../../../../components/form_header.dart';
import '../../../../size_config.dart';
import '../../../details/presentation/pages/details_screen.dart';
import 'food_tile.dart';

class PartnerBody extends StatefulWidget {
  const PartnerBody({
    Key? key,
    required this.uid,
    required this.sameFloorUsers,
  }) : super(key: key);
  final String uid;
  final List<String> sameFloorUsers;

  @override
  State<PartnerBody> createState() => _PartnerBodyState();
}

class _PartnerBodyState extends State<PartnerBody> {
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
          return ordersBody(state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget ordersBody(OrderLoaded orders) {
    final List<OrderEntity> availableOrders = [];
    for (var i = 0; i < orders.orders.length; i++) {
      for (var j = 0; j < widget.sameFloorUsers.length; j++) {
        if (orders.orders[i].uid == widget.sameFloorUsers[j]) {
          availableOrders.add(orders.orders[i]);
          continue;
        }
      }
    }
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const FormHeader(
              title: "Orders",
              subTitle:
                  "These are your floor mates' orders. Tap for details and to select them.",
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(31))
                  .copyWith(top: getProportionateScreenHeight(40)),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: availableOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(
                                        order: availableOrders[index],
                                        btnAction: 'Select',
                                        uid: widget.uid,
                                      )));
                        },
                        child: PartnerFoodTile(
                          name: availableOrders[index].name,
                          roomNo: availableOrders[index].room,
                          food: availableOrders[index].food,
                          location: availableOrders[index].location,
                          ammount: availableOrders[index].amount,
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
