import 'package:hive/hive.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String imagePath;

  @HiveField(4)
  final String genre;

  @HiveField(5)
  final double rating;

  @HiveField(6)
  final bool available;

  @HiveField(7)
  final String notes;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.genre,
    this.rating = 0.0,
    this.available = true,
    this.notes = '',
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final hasDocsFields =
        json.containsKey('cover_i') || json.containsKey('author_name');

    if (hasDocsFields) {
      return BookModel(
        id: json['key'] ?? '',
        title: json['title'] ?? 'Unknown Title',
        author: (json['author_name'] != null && json['author_name'].isNotEmpty)
            ? json['author_name'][0]
            : 'Unknown Author',
        imagePath: (json['cover_i'] != null)
            ? "https://covers.openlibrary.org/b/id/${json['cover_i']}-M.jpg"
            : '',
        genre: (json['subject'] != null && json['subject'].isNotEmpty)
            ? json['subject'][0]
            : 'Unknown Genre',
        rating: (json['ratings_average'] != null)
            ? (json['ratings_average'] as num).toDouble()
            : 0.0,
        available: true,
        notes: json['notes'] ?? '',
      );
    } else {
      return BookModel(
        id: json['key'] ?? '',
        title: json['title'] ?? 'Unknown Title',
        author: (json['authors'] != null && json['authors'].isNotEmpty)
            ? json['authors'][0]['name'] ?? 'Unknown Author'
            : 'Unknown Author',
        imagePath: json['cover']?['medium'] ?? json['cover']?['small'] ?? '',
        genre: (json['subjects'] != null && json['subjects'].isNotEmpty)
            ? json['subjects'][0]
            : 'Unknown Genre',
        rating: 0.0,
        available: true,
        notes: json['notes'] ?? '',
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'key': id,
      'title': title,
      'author': author,
      'imagePath': imagePath,
      'genre': genre,
      'rating': rating,
      'available': available,
      'notes': notes,
    };
  }
}
