import '../../domain/entities/book.dart';

abstract class DDDFavoriteRepository{
  Future<List<Book>> getAll(String userId);
  Future add(String bookId, String userId);
}