import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class SignupUseCase {
  final FirebaseRepository repository;

  SignupUseCase(this.repository);

  Future<void> call(String email, String password) async {
    return repository.signUp(email, password);
  }
}
