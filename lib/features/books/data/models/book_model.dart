class BookModel {
  final int id;
  final String title;
  final String author;
  final String imagePath;
  final String genre;
  final double rating;
  final bool available;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.genre,
    this.rating = 4.0,
    this.available = true,
  });
}
