import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class UnselectOrderUseCase {
  final FirebaseRepository repository;
  UnselectOrderUseCase({
    required this.repository,
  });

  Future<void> call() async {
    return await repository.unselectOrder();
  }
}
