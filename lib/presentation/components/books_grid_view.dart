import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liberapp/domain/entities/book.dart';
import 'package:liberapp/presentation/components/features/book_view_card.dart';
import 'package:liberapp/presentation/repositories/book_repository.dart';

class BookGridView extends StatefulWidget {
  final String type;
  final String? subject;

  const BookGridView({Key? key, required this.type, this.subject})
      : super(key: key);

  @override
  State<BookGridView> createState() => _BookGridViewState();
}

class _BookGridViewState extends State<BookGridView> {
  BookRepository bookRepository = BookRepository();
  //TO DO category filter
  @override
  Widget build(BuildContext context) {
    List<Book> bookList = bookRepository.bookListFilter(widget.type, widget.subject);
    
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: bookList.length,
      itemBuilder: (BuildContext context, int index) {
        return BookViewCard(book: bookList[index]);
      },
    );
  }
}

/**
 * GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: bookList.length,
      itemBuilder: (BuildContext context, int index) {
        return BookViewCard(book: bookList[index]);
      },
    );
 */
