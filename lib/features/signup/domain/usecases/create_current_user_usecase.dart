import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class CreateCurrentUserUsecase {
  final FirebaseRepository repository;

  CreateCurrentUserUsecase({required this.repository});

  Future<void> call(
    String email,
    String firstName,
    String lastName,
    String uid,
    String userClass,
    String hall,
    String floor,
    String wing,
    String roomNo,
  ) async {
    repository.createCurrentUser(
        email, firstName, lastName, uid, userClass, hall, floor, wing, roomNo);
  }
}
