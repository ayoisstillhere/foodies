import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../add_order/data/models/order_model.dart';

import '../models/user_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> signUp(String email, String password);
  Future<void> login(String email, String password);
  Future<bool> isLogin();
  Future<String> getCurrentUid();
  Future<void> createCurrentUser(
    String email,
    String firstName,
    String lastName,
    String userClass,
    String hall,
    String floor,
    String wing,
    String roomNo,
  );
  Stream<List<UserModel>> getUsers();
  Future<void> placeOrder(
    String uid,
    String name,
    String room,
    String food,
    String location,
    String amount,
    String details,
    String status,
    String partnerAssigned,
  );
  Stream<List<OrderModel>> getOrders();
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");
  final _orderCollection = FirebaseFirestore.instance.collection("orders");

  @override
  Future<String> getCurrentUid() async => _auth.currentUser!.uid;

  @override
  // ignore: unnecessary_null_comparison
  Future<bool> isLogin() async => _auth.currentUser!.uid != null;

  @override
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> createCurrentUser(
    String email,
    String firstName,
    String lastName,
    String userClass,
    String hall,
    String floor,
    String wing,
    String roomNo,
  ) async {
    _userCollection.doc(_auth.currentUser!.uid).get().then((user) {
      if (!user.exists) {
        final newUser = UserModel(
          email: email,
          firstName: firstName,
          lastName: lastName,
          uid: _auth.currentUser!.uid,
          userClass: userClass,
          hall: hall,
          floor: floor,
          wing: wing,
          roomNo: roomNo,
        ).toDocument();
        _userCollection.doc(_auth.currentUser!.uid).set(newUser);
        return;
      }
    });
  }

  @override
  Stream<List<UserModel>> getUsers() {
    return _userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((docSnapshot) => UserModel.fromSnapshot(docSnapshot))
        .toList());
  }

  @override
  Future<void> placeOrder(
      String uid,
      String name,
      String room,
      String food,
      String location,
      String amount,
      String details,
      String status,
      String partnerAssigned) async {
    final newOrder = OrderModel(
      uid: uid,
      name: name,
      room: room,
      food: food,
      location: location,
      amount: amount,
      details: details,
      status: status,
      partnerAssigned: partnerAssigned,
    ).toDocument();
    _orderCollection.doc().set(newOrder);
    return;
  }

  @override
  Stream<List<OrderModel>> getOrders() {
    return _orderCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((docSnapshot) => OrderModel.fromSnapshot(docSnapshot))
        .toList());
  }
}
