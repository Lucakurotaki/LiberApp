import 'package:flutter/material.dart';
import 'package:liberapp/domain/entities/book.dart';
import 'package:liberapp/presentation/components/books_grid_view.dart';
import 'package:liberapp/presentation/components/features/search_bar.dart';
import 'package:liberapp/presentation/repositories/favorites_repository.dart';
import 'package:liberapp/presentation/repositories/orders_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../repositories/cart_repository.dart';

class BookDetails extends StatefulWidget {
  final Book book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  late FavoritesRepository favorites;
  late CartRepository cart;
  late OrdersRepository orders;

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoritesRepository>(context);
    cart = Provider.of<CartRepository>(context);
    orders = Provider.of<OrdersRepository>(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SearchBar(),
          SizedBox(
              height: 300.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      widget.book.image,
                      height: 150,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              widget.book.title,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text("R\$${widget.book.price}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                          )
                        ],
                      )),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            "Autor",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(widget.book.author,
                              style: const TextStyle(fontSize: 11),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text("Ano",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                              textAlign: TextAlign.center),
                          subtitle: Text("${widget.book.year}",
                              style: const TextStyle(fontSize: 11),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text("Editora",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                              textAlign: TextAlign.center),
                          subtitle: Text(widget.book.publisher,
                              style: const TextStyle(fontSize: 11),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  )
                ],
              )),

          ListTile(
            title: const Text(
              "Descrição",
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(widget.book.description),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      orders.save(widget.book);
                    },
                    color: Colors.indigo,
                    elevation: 2.0,
                    child: const Text("Comprar",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                
              ],
            ),
          ),

          const Divider(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Livros semelhantes'),
          ),

          //Produtos similares
         SizedBox(
            height: 360,
            child: BookGridView(type: 'category', subject: widget.book.category, ),
          )
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.indigo,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.add_shopping_cart, color: Colors.green),
              onTap: () {
                cart.save(widget.book);
              }),
          SpeedDialChild(
              child: const Icon(Icons.favorite, color: Colors.red),
              onTap: () {
                favorites.save(widget.book);
                //TO DO icon change
              }),
        ],
      ),
    );
  }
}

