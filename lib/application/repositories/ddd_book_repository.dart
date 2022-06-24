import '../../domain/entities/book.dart';

abstract class DDDBookRepository{
  Future<Book> getById(String id);
  Future<List<Book>> getAll();
}