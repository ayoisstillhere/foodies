import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies/features/signup/data/models/user_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> signUp(String email, String password);
  Future<void> login(String email, String password);
  Future<bool> isLogin();
  Future<String> getCurrentUid();
  Future<void> createCurrentUser(
    String email,
    String firstName,
    String lastName,
    String uid,
    String userClass,
    String hall,
    String floor,
    String wing,
    String roomNo,
  );
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");

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
    String uid,
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
          uid: uid,
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
}