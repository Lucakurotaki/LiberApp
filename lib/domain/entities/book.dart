class Book{
  final String id;
  final String image;
  final String title;
  final String author;
  final String category;
  final String description;
  final int year;
  final String publisher;
  final double price;

  const Book({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.year,
    required this.publisher,
    required this.price
  });
}