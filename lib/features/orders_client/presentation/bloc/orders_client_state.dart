part of 'orders_client_bloc.dart';

abstract class OrdersClientState extends Equatable {
  const OrdersClientState();  

  @override
  List<Object> get props => [];
}
class OrdersClientInitial extends OrdersClientState {}
