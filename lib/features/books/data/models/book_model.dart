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

  @HiveField(8)
  final String publishedDate;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.genre,
    this.rating = 1.0,
    this.available = true,
    this.notes = '',
    this.publishedDate = '',
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};

    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'Unknown Title',
      author:
          (volumeInfo['authors'] != null &&
              (volumeInfo['authors'] as List).isNotEmpty)
          ? volumeInfo['authors'][0]
          : 'Unknown Author',
      imagePath: volumeInfo['imageLinks']?['thumbnail'] ?? '',
      genre:
          (volumeInfo['categories'] != null &&
              (volumeInfo['categories'] as List).isNotEmpty)
          ? volumeInfo['categories'][0]
          : 'Unknown Genre',
      rating: (volumeInfo['averageRating'] != null)
          ? (volumeInfo['averageRating'] as num).toDouble()
          : 0.0,
      available: true,
      notes: volumeInfo['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
