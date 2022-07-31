import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'orders_partner_event.dart';
part 'orders_partner_state.dart';

class OrdersPartnerBloc extends Bloc<OrdersPartnerEvent, OrdersPartnerState> {
  OrdersPartnerBloc() : super(OrdersPartnerInitial()) {
    on<OrdersPartnerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
