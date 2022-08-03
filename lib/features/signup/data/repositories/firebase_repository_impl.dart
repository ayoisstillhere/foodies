import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  @override
  Future<void> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
  @override
  Future<String> getCurrentUid() {
    // TODO: implement getCurrentUid
    throw UnimplementedError();
  }
  
  @override
  Future<bool> isLogin() {
    // TODO: implement isLogin
    throw UnimplementedError();
  }
  
  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<void> createCurrentUser(String email, String firstName, String lastName, String uid, String userClass, String hall, String floor, String wing, String roomNo) {
    // TODO: implement createCurrentUser
    throw UnimplementedError();
  }
}