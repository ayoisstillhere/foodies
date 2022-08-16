import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required String uid,
    required String name,
    required String room,
    required String food,
    required String location,
    required String amount,
    required String details,
    required String status,
    required String partnerAssigned,
    required String orderId,
  }) : super(
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
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uid: json["uid"],
      name: json["name"],
      room: json["room"],
      food: json["food"],
      location: json["location"],
      amount: json["amount"],
      details: json["details"],
      status: json["status"],
      partnerAssigned: json["partnerAssigned"],
      orderId: json["orderId"],
    );
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return OrderModel(
      uid: (documentSnapshot.data()! as dynamic)['uid'],
      name: (documentSnapshot.data()! as dynamic)['name'],
      room: (documentSnapshot.data()! as dynamic)['room'],
      food: (documentSnapshot.data()! as dynamic)['food'],
      location: (documentSnapshot.data()! as dynamic)['location'],
      amount: (documentSnapshot.data()! as dynamic)['amount'],
      details: (documentSnapshot.data()! as dynamic)['details'],
      status: (documentSnapshot.data()! as dynamic)['status'],
      partnerAssigned: (documentSnapshot.data()! as dynamic)['partnerAssigned'],
      orderId: (documentSnapshot.data()! as dynamic)['orderId'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "name": name,
      "room": room,
      "food": food,
      "location": location,
      "amount": amount,
      "details": details,
      "status": status,
      "partnerAssigned": partnerAssigned,
      "orderId":orderId,
    };
  }
}
