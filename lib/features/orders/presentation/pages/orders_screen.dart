import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../components/bottom_nav_bar.dart';
import '../../../add_order/presentation/pages/add_order.dart';
import '../widgets/partner_body.dart';

import '../../../home/presentation/bloc/user_bloc/user_cubit.dart';
import '../../../signup/data/models/user_model.dart';
import '../widgets/client_body.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<String> sameFloorUsers = [];
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserLoaded) {
          return ordersScaffold(state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Scaffold ordersScaffold(UserLoaded users) {
    final user = users.users.firstWhere(
      (user) => user.uid == widget.uid,
      orElse: () => const UserModel(
          email: "",
          firstName: "",
          lastName: "",
          uid: "",
          userClass: "",
          hall: "",
          floor: "",
          wing: "",
          roomNo: ""),
    );
    for (var i = 0; i < users.users.length; i++) {
      if (users.users[i].hall == user.hall &&
          users.users[i].wing == user.wing &&
          users.users[i].floor == user.floor) {
        sameFloorUsers.add(users.users[i].uid);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: user.userClass == "Client"
          ? ClientBody(uid: widget.uid)
          : PartnerBody(uid: widget.uid, sameFloorUsers:sameFloorUsers),
      bottomNavigationBar: BottomNavBar(selected: 1, uid: widget.uid),
      floatingActionButton: user.userClass == "Client"
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddOrder(
                            uid: user.uid,
                            name: "${user.firstName} ${user.lastName}",
                            room: user.roomNo)));
              },
              child: SvgPicture.asset(
                "assets/icons/floating_action_icon.svg",
              ),
            )
          : null,
    );
  }
}
