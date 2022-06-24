import 'package:flutter/material.dart';
import 'package:liberapp/presentation/repositories/base_repository.dart';
import '../../pages/book_details.dart';
import '../../../domain/entities/book.dart';
import 'number_format_real.dart';

class BookCard extends StatefulWidget {
  final Book book;
  final BaseRepository provier;
  final bool menuItemIsEnabled;
  const BookCard(
      {Key? key,
      required this.book,
      required this.provier,
      this.menuItemIsEnabled = true})
      : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  goToDetailPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetails(
                  book: widget.book,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => goToDetailPage(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.asset(
                widget.book.image,
                height: 40,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.book.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.book.author,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                real.format(widget.book.price),
                style: const TextStyle(fontSize: 16, color: Colors.indigo),
              ),
              PopupMenuButton(
                enabled: widget.menuItemIsEnabled,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.remove_shopping_cart, color: Colors.red[900],),
                      title: const Text('Remover'),
                      onTap: () {
                        Navigator.pop(context);
                        widget.provier.remove(widget.book);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
