import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodies/features/add_order/domain/entities/order_entity.dart';

import 'package:foodies/features/orders/domain/usecases/get_orders_usecase.dart';

import '../../../domain/usecases/place_order_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final PlaceOrderUseCase placeOrderUseCase;
  final GetOrdersUseCase getOrdersUseCase;

  OrderCubit({
    required this.placeOrderUseCase,
    required this.getOrdersUseCase,
  }) : super(OrderInitial());

  Future<void> placeOrder({
    required String uid,
    required String name,
    required String room,
    required String food,
    required String location,
    required String amount,
    required String details,
    required String status,
    required String partnerAssigned,
  }) async {
    emit(OrderLoading());
    try {
      await placeOrderUseCase.call(
        uid,
        name,
        room,
        food,
        location,
        amount,
        details,
        status,
        partnerAssigned,
      );
      emit(OrderSuccess());
    } on SocketException catch (e) {
      emit(OrderFailure(e.message));
    } catch (_) {
      emit(OrderFailure("Firebase Exception"));
    }
  }

  Future<void> getOrders() async {
    try {
      final order = getOrdersUseCase.call();
      order.listen((orders) {
        emit(OrderLoaded(orders: orders));
      });
    } on SocketException catch (_) {}
  }
}
