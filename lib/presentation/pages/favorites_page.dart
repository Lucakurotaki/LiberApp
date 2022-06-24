import 'package:flutter/material.dart';
import 'package:liberapp/presentation/components/features/book_card.dart';
import 'package:liberapp/presentation/repositories/favorites_repository.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<FavoritesRepository>(
          builder: (context, favorites, child){
            return favorites.list.isEmpty
            ? const ListTile(
              leading: Icon(Icons.favorite),
              title: Text('A lista de favoritos está vazia') ,
            )
            : ListView.builder(
              itemCount: favorites.list.length,
              itemBuilder: (_, index){
                return BookCard(
                  book: favorites.list[index],
                  provier: Provider.of<FavoritesRepository>(context, listen: false),
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