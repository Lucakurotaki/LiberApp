import 'package:flutter/material.dart';
import 'package:liberapp/presentation/components/books_grid_view.dart';
import 'package:liberapp/presentation/components/features/search_bar.dart';

class SearchPage extends StatefulWidget {
  final String searchWord;
  const SearchPage({Key? key, required this.searchWord}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                    'Resultado da busca por: ${widget.searchWord}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )),
            Flexible(
              child: BookGridView(type: 'search', subject: widget.searchWord),
            )
          ],
        ));
  }
}
