import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String uid;
  final String name;
  final String room;
  final String food;
  final String location;
  final String amount;
  final String details;
  final String status;
  final String partnerAssigned;
  final String orderId;

  const OrderEntity(
    this.uid,
    this.name,
    this.room,
    this.food,
    this.location,
    this.amount,
    this.details,
    this.status,
    this.partnerAssigned,
    this.orderId,
  );

  @override
  List<Object?> get props => [
        uid,
        name,
        room,
        food,
        location,
        amount,
        details,
        status,
        partnerAssigned,
        orderId,
      ];
}
