import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class GetCurrentUidUseCase {
  final FirebaseRepository repository;

  GetCurrentUidUseCase(this.repository);

  Future<String> call() async => await repository.getCurrentUid();
}
