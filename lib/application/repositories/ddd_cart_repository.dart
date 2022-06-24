import '../../domain/entities/book.dart';

abstract class DDDCartRepository{
  Future<List<Book>> getAll(String userId);
  Future add(String bookId, String userId);
}