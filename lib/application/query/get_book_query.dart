import '../../domain/entities/book.dart';
import '../repositories/ddd_book_repository.dart';

abstract class GetBookRequestModel{
  late String id;
}

class GetBookQuery{
  final DDDBookRepository bookRepository;

  GetBookQuery({
    required this.bookRepository,
  });

  Future<Book> execute(GetBookRequestModel request){
    final String requestId = request.id;

    return bookRepository.getById(requestId);
  }
}