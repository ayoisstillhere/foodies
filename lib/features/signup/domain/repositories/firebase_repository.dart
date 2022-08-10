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
}
