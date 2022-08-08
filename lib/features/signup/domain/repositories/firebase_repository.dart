import '../entities/user_entity.dart';

abstract class FirebaseRepository {
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
  Stream<List<UserEntity>> getUsers();
}
