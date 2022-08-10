import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'orders_client_event.dart';
part 'orders_client_state.dart';

class OrdersClientBloc extends Bloc<OrdersClientEvent, OrdersClientState> {
  OrdersClientBloc() : super(OrdersClientInitial()) {
    on<OrdersClientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
