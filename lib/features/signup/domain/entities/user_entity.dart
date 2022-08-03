import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String uid;
  final String userClass;
  final String hall;
  final String floor;
  final String wing;
  final String roomNo;

  const User(
    this.email,
    this.firstName,
    this.lastName,
    this.uid,
    this.userClass,
    this.hall,
    this.floor,
    this.wing,
    this.roomNo,
  );

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        uid,
        userClass,
        hall,
        floor,
        wing,
        roomNo,
      ];
}
