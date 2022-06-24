import 'package:liberapp/application/repositories/ddd_book_repository.dart';

import '../../domain/entities/book.dart';

class GetAllBooksQuery{
  final DDDBookRepository bookRepository;

  GetAllBooksQuery({
    required this.bookRepository
  });

  Future<List<Book>> execute(){
    return bookRepository.getAll();
  }
}