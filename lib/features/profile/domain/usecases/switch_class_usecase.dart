import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class SwitchClassUseCase {
  final FirebaseRepository repository;
  SwitchClassUseCase({
    required this.repository,
  });
  Future<void> call(String userClass, String uid) async {
    return await repository.switchClass(userClass, uid);
  }
}
