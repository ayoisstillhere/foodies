import 'package:foodies/features/add_order/domain/entities/order_entity.dart';
import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class GetOrdersUseCase {
  final FirebaseRepository repository;
  GetOrdersUseCase({
    required this.repository,
  });

  Stream<List<OrderEntity>> call() => repository.getOrders();
}
