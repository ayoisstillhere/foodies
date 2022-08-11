import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/place_order_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final PlaceOrderUseCase placeOrderUseCase;

  OrderCubit({
    required this.placeOrderUseCase,
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
}
