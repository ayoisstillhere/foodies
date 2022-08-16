import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class SelectOrderUseCase {
  final FirebaseRepository repository;
  SelectOrderUseCase({
    required this.repository,
  });

  Future<void> call(String partnerId) async {
    return await repository.selectOrder(partnerId);
  }
}
