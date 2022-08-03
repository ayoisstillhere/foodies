import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class LoginUseCase {
  final FirebaseRepository repository;

  LoginUseCase({required this.repository});

  Future<void> call(String email, String password) {
    return repository.login(email, password);
  }
}
