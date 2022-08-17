import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

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
  Future<void> signOut();
  Future<void> deleteOrder(String orderId);
  Future<void> selectOrder(String orderId, String partnerId);
  Future<void> unselectOrder(String orderId);
  Future<void> switchClass(String userClass, String uid);
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
    String orderId = const Uuid().v1();
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
      orderId: orderId,
    ).toDocument();
    _orderCollection.doc(orderId).set(newOrder);
    return;
  }

  @override
  Stream<List<OrderModel>> getOrders() {
    return _orderCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((docSnapshot) => OrderModel.fromSnapshot(docSnapshot))
        .toList());
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    await _orderCollection.doc(orderId).delete();
  }

  @override
  Future<void> selectOrder(String orderId, String partnerId) async {
    await _orderCollection.doc(orderId).update({
      'partnerAssigned': partnerId,
    });
    await _orderCollection.doc(orderId).update({
      'status': 'Selected',
    });
  }

  @override
  Future<void> unselectOrder(String orderId) async {
    await _orderCollection.doc(orderId).update({
      'partnerAssigned': "",
    });
    await _orderCollection.doc(orderId).update({
      'status': 'Unselected',
    });
  }

  @override
  Future<void> switchClass(String userClass, String uid) async {
    if (userClass == 'Partner') {
      await _userCollection.doc(uid).update({'userClass': 'Client'});
    }else {
      await _userCollection.doc(uid).update({'userClass': 'Partner'});
    }
  }
}
