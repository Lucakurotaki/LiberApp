import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liberapp/domain/entities/book.dart';
import 'package:liberapp/infrastructure/persistence/firestore/db_firestore.dart';
import 'package:liberapp/presentation/repositories/base_repository.dart';
import 'package:liberapp/presentation/repositories/book_repository.dart';
import 'package:liberapp/services/auth_service.dart';

class CartRepository extends BaseRepository{
  final List<Book> _list = [];
  late FirebaseFirestore db;
  late AuthService auth;

  CartRepository({required this.auth}){
    _startRepository();
  }

  _startRepository() async{
    await _startFirestore();
    await _readCart();
  }

  _startFirestore(){
    db = DBFirestore.get();
  }

  _readCart() async{
    if(auth.appUser != null && _list.isEmpty){
      final snapshot = await db.collection('users/${auth.appUser!.uid}/cart').get();

      snapshot.docs.forEach((doc) {
        Book book = BookRepository.list.firstWhere((book) => book.id == doc.get('id'));
        _list.add(book);
        notifyListeners();
      });
    }
  }
  
  @override
  UnmodifiableListView<Book> get list => UnmodifiableListView(_list);

  @override
  save(Book book)async{
    if(!_list.any((element) => element.id == book.id)){
      _list.add(book);
      await db.collection('users/${auth.appUser!.uid}/cart').doc(book.id).set(
        {'id': book.id,
        'title' : book.title,
        'author' : book.author,
        'category' : book.category,
        'year' : book.year}
      );
    }
    notifyListeners();
  }

  @override
  remove(Book book)async {
    await db.collection('users/${auth.appUser!.uid}/cart').doc(book.id).delete();
    _list.remove(book);
    notifyListeners();
  }


}