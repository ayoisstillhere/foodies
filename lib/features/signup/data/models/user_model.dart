import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodies/features/signup/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String email,
    required String firstName,
    required String lastName,
    required String uid,
    required String userClass,
    required String hall,
    required String floor,
    required String wing,
    required String roomNo,
  }) : super(email, firstName, lastName, uid, userClass, hall, floor, wing,
            roomNo);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      uid: json['uid'],
      userClass: json['userClass'],
      hall: json['hall'],
      floor: json['floor'],
      wing: json['wing'],
      roomNo: json['roomNo'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      email: documentSnapshot['email'],
      firstName: documentSnapshot['firstName'],
      lastName: documentSnapshot['lastName'],
      uid: documentSnapshot['uid'],
      userClass: documentSnapshot['userClass'],
      hall: documentSnapshot['hall'],
      floor: documentSnapshot['floor'],
      wing: documentSnapshot['wing'],
      roomNo: documentSnapshot['roomNo'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      email: "email",
      firstName: "firstName",
      lastName: "lastName",
      uid: "uid",
      userClass: "userClass",
      hall: "hall",
      floor: "floor",
      wing: "wing",
      roomNo: "roomNo",
    };
  }
}
