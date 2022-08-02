import 'package:flutter/material.dart';
import 'package:foodies/components/form_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const FormHeader(
            title: "Complete Profile",
            subTitle: "Enter your room details so we can get you some chow!",
          ),
        ],
      ),
    );
  }
}
