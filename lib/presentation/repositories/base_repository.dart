import 'dart:collection';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class BaseRepository extends ChangeNotifier{
  final List<Book> _list = [];

  

  UnmodifiableListView<Book> get list => UnmodifiableListView(_list);

  save(Book book){
    if(!_list.contains(book)) _list.add(book);
    notifyListeners();
  }

  remove(Book book){
    _list.remove(book);
    notifyListeners();
  }
}