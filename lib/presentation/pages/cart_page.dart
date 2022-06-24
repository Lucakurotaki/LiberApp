import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/features/book_card.dart';
import '../repositories/cart_repository.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de compras'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<CartRepository>(
          builder: (context, cart, child){
            return cart.list.isEmpty
            ? const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('O carrinho de compras está vazio') ,
            )
            : ListView.builder(
              itemCount: cart.list.length,
              itemBuilder: (_, index){
                return BookCard(
                  book: cart.list[index],
                  provier: Provider.of<CartRepository>(context, listen: false),
                  menuItemIsEnabled: true,
                );
              } ,
            );
          },
        ),
      ),
    );
  }
}