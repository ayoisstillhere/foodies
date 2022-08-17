import 'package:flutter/material.dart';

import '../../../../components/home_header.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../signup/domain/entities/user_entity.dart';
import 'partner_tile.dart';

class ClientBody extends StatelessWidget {
  const ClientBody({
    Key? key,
    required this.user,
    required this.partners,
  }) : super(key: key);

  final UserEntity user;
  final List<UserEntity> partners;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(firstName: user.firstName),
          SizedBox(height: getProportionateScreenHeight(40)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(31)),
            child: Text(
              "Available Partners:",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(22),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: partners.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  PartnerTile(
                    firstName: partners[index].firstName,
                    lastName: partners[index].lastName,
                    roomNo: partners[index].roomNo,
                  ),
                  SizedBox(height: getProportionateScreenHeight(35)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

