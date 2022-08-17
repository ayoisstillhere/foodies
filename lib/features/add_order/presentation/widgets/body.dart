import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../components/form_header.dart';
import '../bloc/cubit/order_cubit.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.uid,
    required this.name,
    required this.room,
  }) : super(key: key);
  final String uid;
  final String name;
  final String room;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _addOrderFormKey = GlobalKey<FormState>();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _foodController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  final List<String> errors = [];

  @override
  void initState() {
    _locationController = TextEditingController();
    _foodController = TextEditingController();
    _amountController = TextEditingController();
    _detailsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _locationController.dispose();
    _foodController.dispose();
    _amountController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccess) {
          // Go back to orders screen
          Navigator.pop(context);
        }
        if (state is OrderFailure) {
          addError(error: "Error placing Order, please try again!");
        }
      },
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return buildAddOrderForm();
      },
    );
  }

  Form buildAddOrderForm() {
    return Form(
      key: _addOrderFormKey,
      child: Center(
        child: Column(
          children: [
            const FormHeader(
              title: "Add an Order",
              subTitle:
                  "Enter your order details and see if a partner can help!",
            ),
            const Spacer(),
            buildLocationFormField(),
            const Spacer(),
            buildFoodFormField(),
            const Spacer(),
            buildAmountFormField(),
            const Spacer(),
            buildDetailsFormField(),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(31)),
              child: FormError(errors: errors),
            ),
            DefaultButton(
              text: "Place Order",
              press: () async {
                if (_addOrderFormKey.currentState!.validate()) {
                  _addOrderFormKey.currentState!.save();
                  await BlocProvider.of<OrderCubit>(context).placeOrder(
                    uid: widget.uid,
                    name: widget.name,
                    room: widget.room,
                    food: _foodController.text.trim(),
                    location: _locationController.text.trim(),
                    amount: _amountController.text.trim(),
                    details: _detailsController.text.trim(),
                    status: "Unselected",
                    partnerAssigned: "",
                  );
                }
              },
              color: kSecondaryColor,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Padding buildLocationFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kLocationNullError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kLocationNullError);
            return "";
          }
          return null;
        },
        controller: _locationController,
        decoration: const InputDecoration(
          labelText: "Location",
          hintText: "E.g CAFE 1",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/location_icon.svg',
          ),
        ),
      ),
    );
  }

  Padding buildFoodFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kFoodNullError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kFoodNullError);
            return "";
          }
          return null;
        },
        controller: _foodController,
        decoration: const InputDecoration(
          labelText: "Food",
          hintText: "Enter meal name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/food_icon.svg',
          ),
        ),
      ),
    );
  }

  Padding buildAmountFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kAmountNullError);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kAmountNullError);
            return "";
          }
          return null;
        },
        controller: _amountController,
        decoration: const InputDecoration(
          labelText: "Amount",
          hintText: "How much will it cost?",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/amount_icon.svg',
          ),
        ),
      ),
    );
  }

  Padding buildDetailsFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(31.0),
      ),
      child: TextFormField(
        maxLines: 4,
        controller: _detailsController,
        decoration: const InputDecoration(
          labelText: "Details",
          hintText: "Extra details(Optional)",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/details_icon.svg',
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
