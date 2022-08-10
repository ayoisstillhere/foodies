import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());
}
