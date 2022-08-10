import '../../domain/entities/user_entity.dart';

import '../datasources/firebase_remote_datasource.dart';
import '../../domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});

  @override
  Future<void> signUp(String email, String password) async =>
      await firebaseRemoteDataSource.signUp(email, password);

  @override
  Future<String> getCurrentUid() async =>
      await firebaseRemoteDataSource.getCurrentUid();

  @override
  Future<bool> isLogin() async => await firebaseRemoteDataSource.isLogin();

  @override
  Future<void> login(String email, String password) async =>
      await firebaseRemoteDataSource.login(email, password);

  @override
  Future<void> createCurrentUser(
      String email,
      String firstName,
      String lastName,
      String userClass,
      String hall,
      String floor,
      String wing,
      String roomNo) async {
    return await firebaseRemoteDataSource.createCurrentUser(
      email,
      firstName,
      lastName,
      userClass,
      hall,
      floor,
      wing,
      roomNo,
    );
  }

  @override
  Stream<List<UserEntity>> getUsers() {
    return firebaseRemoteDataSource.getUsers();
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
    return await firebaseRemoteDataSource.placeOrder(
      uid,
      name,
      room,
      food,
      location,
      amount,
      details,
      status,
      partnerAssigned,
    );
  }
}
