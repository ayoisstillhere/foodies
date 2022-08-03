abstract class FirebaseRepository {
  Future<void> signUp(String email, String password);
  Future<void> login(String email, String password);
  Future<bool> isSignIn();
  Future<String> getCurrentUid(Comparable);
}
