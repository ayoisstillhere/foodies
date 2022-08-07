import '../repositories/firebase_repository.dart';

class CreateCurrentUserUsecase {
  final FirebaseRepository repository;

  CreateCurrentUserUsecase({required this.repository});

  Future<void> call(
    String email,
    String firstName,
    String lastName,
    String userClass,
    String hall,
    String floor,
    String wing,
    String roomNo,
  ) async {
    repository.createCurrentUser(
        email, firstName, lastName, userClass, hall, floor, wing, roomNo);
  }
}
