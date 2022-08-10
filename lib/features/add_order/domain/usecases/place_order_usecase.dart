import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';

class PlaceOrderUseCase {
  final FirebaseRepository repository;
  PlaceOrderUseCase({
    required this.repository,
  });

  Future<void> call(
    String uid,
    String name,
    String room,
    String food,
    String location,
    String amount,
    String details,
    String status,
    String partnerAssigned,
  ) async {
    return repository.placeOrder(uid, name, room, food, location, amount,
        details, status, partnerAssigned);
  }
}
