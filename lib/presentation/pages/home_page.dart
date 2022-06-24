import 'package:flutter/material.dart';
import 'package:liberapp/presentation/components/books_grid_view.dart';
import 'package:liberapp/presentation/components/features/draw_bar.dart';
import 'package:liberapp/presentation/components/features/search_bar.dart';
import '../components/carousel_gallery.dart';
import '../components/categories_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final Color mainColor = Colors.indigo;
  final Color secondColor = Colors.white;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const DrawBar(),
      body: Column(children: <Widget>[
        const SearchBar(),
        //padding widget
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Categorias'),
          ) 
        ),

        //lista de categorias
        const CategoriesList(),

        //service carousel
        carouselGallery,
        

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Sugestões para você!'),
          )
        ),

        const Flexible(
          flex: 2,
          child: BookGridView(type: 'random'),
        )
      ]),
    );
  }
}