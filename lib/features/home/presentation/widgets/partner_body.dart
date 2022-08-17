import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodies/features/add_order/domain/entities/order_entity.dart';
import 'package:foodies/features/add_order/presentation/bloc/cubit/order_cubit.dart';

import '../../../../components/form_header.dart';
import '../../../../components/home_header.dart';
import '../../../../size_config.dart';
import '../../../details/presentation/pages/details_screen.dart';
import '../../../orders/presentation/widgets/partner_food_tile.dart';
import '../../../signup/domain/entities/user_entity.dart';

class PartnerBody extends StatefulWidget {
  const PartnerBody({
    Key? key,
    required this.user,
    required this.sameFloorUsers,
  }) : super(key: key);

  final UserEntity user;
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
    final List<OrderEntity> selectedOrders = [];
    for (var i = 0; i < orders.orders.length; i++) {
      for (var j = 0; j < widget.sameFloorUsers.length; j++) {
        if (orders.orders[i].uid == widget.sameFloorUsers[j] && orders.orders[i].status == "Selected") {
          selectedOrders.add(orders.orders[i]);
          continue;
        }
      }
    }
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(firstName: widget.user.firstName),
          SizedBox(height: getProportionateScreenHeight(40)),
          const Center(
            child: FormHeader(
              title: "Selected Orders",
              subTitle: "Tap Orders for Details",
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(31)),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(
                                        order: selectedOrders[index],
                                        btnAction: 'Unselect',
                                        uid: widget.user.uid,
                                      )));
                        },
                        child: PartnerFoodTile(
                          name: selectedOrders[index].name,
                          roomNo: selectedOrders[index].room,
                          food: selectedOrders[index].food,
                          location: selectedOrders[index].location,
                          ammount: selectedOrders[index].amount,
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
    );
  }
}
