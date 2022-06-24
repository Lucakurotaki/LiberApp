import 'package:liberapp/application/repositories/ddd_favorite_repository.dart';

import '../../domain/entities/book.dart';

abstract class GetFavoritesRequestModel{
  late String userId;
}

class GetFavoritesQuery{
  final DDDFavoriteRepository favoriteRepository;

  GetFavoritesQuery({
    required this.favoriteRepository
  });

  Future<List<Book>> execute(GetFavoritesRequestModel request){
    final String requestUserId = request.userId;

    return favoriteRepository.getAll(requestUserId);
  }
}