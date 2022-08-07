import 'package:foodies/features/signup/domain/entities/user_entity.dart';
import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class GetUsersUsecase {
  final FirebaseRepository repository;
  GetUsersUsecase({
    required this.repository,
  });

  Stream<List<UserEntity>> call() => repository.getUsers();
}
