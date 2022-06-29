import 'package:flutter/material.dart';
import 'package:liberapp/presentation/pages/categories_page.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Category(
            iconChar: 'F',
            iconCaption: 'Ficção',
          ),
          Category(
            iconChar: 'E',
            iconCaption: 'Educação',
          ),
          Category(
            iconChar: 'I',
            iconCaption: 'Infantil',
          ),
          Category(
            iconChar: 'B',
            iconCaption: 'Biografia',
          ),
          Category(
            iconChar: 'HQ',
            iconCaption: 'HQ',
          ),
          Category(
            iconChar: 'A',
            iconCaption: 'Arte',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String iconChar;
  final String iconCaption;

  const Category({Key? key, required this.iconChar, required this.iconCaption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          onTap: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriesPage(category: iconCaption)));
          },
          child: SizedBox(
            width: 100.0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(
                tileColor: Colors.indigo[50],
                title: Text(
                  iconChar,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  iconCaption,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )),
    );
  }
}