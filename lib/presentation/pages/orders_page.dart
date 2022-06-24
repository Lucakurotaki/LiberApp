import 'package:flutter/material.dart';
import 'package:liberapp/presentation/components/features/book_card.dart';
import 'package:liberapp/presentation/repositories/orders_repository.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<OrdersRepository>(
          builder: (context, favorites, child){
            return favorites.list.isEmpty
            ? const ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('A lista de pedidos está vazia') ,
            )
            : ListView.builder(
              itemCount: favorites.list.length,
              itemBuilder: (_, index){
                return BookCard(
                  book: favorites.list[index],
                  provier: Provider.of<OrdersRepository>(context, listen: false),
                  menuItemIsEnabled: false,
                );
              } ,
            );
          },
        ),
      ),
    );
  }
}