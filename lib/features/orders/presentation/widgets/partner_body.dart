import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/features/add_order/presentation/bloc/cubit/order_cubit.dart';

import '../../../../components/form_header.dart';

class PartnerBody extends StatefulWidget {
  const PartnerBody({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            FormHeader(
              title: "Orders",
              subTitle:
                  "These are your floor mates’ orders. Tap for details and to select them.",
            ),
          ],
        ),
      ),
    );
  }
}
