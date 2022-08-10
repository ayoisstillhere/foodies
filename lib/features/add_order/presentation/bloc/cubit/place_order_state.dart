part of 'place_order_cubit.dart';

abstract class PlaceOrderState extends Equatable {
  const PlaceOrderState();
}

class PlaceOrderInitial extends PlaceOrderState {
  @override
  List<Object> get props => [];
}

class PlaceOrderLoading extends PlaceOrderState {
  @override
  List<Object?> get props => [];
}

class PlaceOrderFailure extends PlaceOrderState {
  final String errorMessage;

  PlaceOrderFailure(this.errorMessage);


  @override
  List<Object?> get props => [this.errorMessage];
}

class PlaceOrderSuccess extends PlaceOrderState{
  @override
  List<Object?> get props => [];
}