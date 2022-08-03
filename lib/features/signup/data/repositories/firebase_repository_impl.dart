import 'package:foodies/features/signup/data/datasources/firebase_remote_datasource.dart';
import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

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
      String uid,
      String userClass,
      String hall,
      String floor,
      String wing,
      String roomNo) async {
    return await firebaseRemoteDataSource.createCurrentUser(
      email,
      firstName,
      lastName,
      uid,
      userClass,
      hall,
      floor,
      wing,
      roomNo,
    );
  }
}
