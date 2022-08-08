import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");
  final _partnerCollection = FirebaseFirestore.instance.collection("partners");
  final _clientCollection = FirebaseFirestore.instance.collection("clients");

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
        if (userClass == "Partner") {
          _partnerCollection.doc("allPartners").update({
            'Partners': FieldValue.arrayUnion([_auth.currentUser!.uid]),
          });
        }
        if (userClass == "Client") {
          _clientCollection.doc("allClients").update({
            'Clients': FieldValue.arrayUnion([_auth.currentUser!.uid]),
          });
        }
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
}
