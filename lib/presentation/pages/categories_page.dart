import 'package:flutter/material.dart';
import 'package:liberapp/presentation/components/books_grid_view.dart';
import 'package:liberapp/presentation/components/features/search_bar.dart';

class CategoriesPage extends StatefulWidget {
  final String category;
  const CategoriesPage({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SearchBar(),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Categoria: ${widget.category}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )),
            Flexible(
              child: BookGridView(type: 'category', subject: widget.category),
            )
          ],
        ));
  }
}
