import 'package:liberapp/application/repositories/ddd_cart_repository.dart';

import '../../domain/entities/book.dart';

abstract class GetCartItemsRequestModel{
  late String userId;
}

class GetCartItemsQuery{
  final DDDCartRepository cartRepository;

  GetCartItemsQuery({
    required this.cartRepository
  });

  Future<List<Book>> execute(GetCartItemsRequestModel request){
    final String requestUserId = request.userId;

    return cartRepository.getAll(requestUserId);
  }
}