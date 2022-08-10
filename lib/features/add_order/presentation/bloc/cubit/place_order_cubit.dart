import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/place_order_usecase.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final PlaceOrderUseCase placeOrderUseCase;

  PlaceOrderCubit({
    required this.placeOrderUseCase,}
  ) : super(PlaceOrderInitial());

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
    emit(PlaceOrderLoading());
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
      emit(PlaceOrderSuccess());
    } on SocketException catch (e) {
      emit(PlaceOrderFailure(e.message));
    } catch (_) {
      emit(PlaceOrderFailure("Firebase Exception"));
    }
  }
}
