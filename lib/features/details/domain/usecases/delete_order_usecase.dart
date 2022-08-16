import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class DeleteOrderUseCase {
  final FirebaseRepository repository;
  DeleteOrderUseCase({
    required this.repository,
  });

  Future<void> call(String orderId) async {
    return await repository.deleteOrder(orderId);
  }
}
