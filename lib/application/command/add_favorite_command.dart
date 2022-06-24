import 'package:liberapp/application/repositories/ddd_favorite_repository.dart';

abstract class AddFavoriteRequestModel{
  late String bookId;
  late String userId;
}

class AddFavoriteCommand{
  final DDDFavoriteRepository favoriteRepository;

  AddFavoriteCommand({
    required this.favoriteRepository
  });

  Future execute(AddFavoriteRequestModel request){
    final String requestBookId = request.bookId;
    final String requestUserId = request.userId;

    return favoriteRepository.add(requestBookId, requestUserId);
  }
}