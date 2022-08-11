part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderLoading extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderFailure extends OrderState {
  final String errorMessage;

  OrderFailure(this.errorMessage);

  @override
  List<Object?> get props => [this.errorMessage];
}

class OrderSuccess extends OrderState {
  @override
  List<Object?> get props => [];
}
