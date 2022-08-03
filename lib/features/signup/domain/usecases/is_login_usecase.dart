import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class IsLoginUseCase {
  final FirebaseRepository repository;

  IsLoginUseCase({required this.repository});

  Future<bool> call() async => await repository.isLogin();
}
