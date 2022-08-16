import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class DeleteOrderUseCae {
  final FirebaseRepository repository;
  DeleteOrderUseCae({
    required this.repository,
  });

  Future<void> call(String orderId) async {
    return await repository.deleteOrder(orderId);
  }
}
