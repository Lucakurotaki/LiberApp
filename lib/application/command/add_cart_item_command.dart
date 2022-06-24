import 'package:liberapp/application/repositories/ddd_cart_repository.dart';

abstract class AddCartItemRequestModel{
  late String bookId;
  late String userId;
}

class AddCartItemCommand{
  final DDDCartRepository cartRepository;

  AddCartItemCommand({
    required this.cartRepository
  });

  Future execute(AddCartItemRequestModel request){
    final String requestBookId = request.bookId;
    final String requestUserId = request.userId;

    return cartRepository.add(requestBookId, requestUserId);
  }
}