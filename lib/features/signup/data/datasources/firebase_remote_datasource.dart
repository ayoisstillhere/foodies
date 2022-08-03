abstract class FirebaseRemoteDataSource {
  Future<void> signUp(String email, String password);
  Future<void> login(String email, String password);
  Future<bool> isLogin();
  Future<String> getCurrentUid();
  Future<void> getCreateCurrentUser(
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

