import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class BookService {
  static const String baseUrl = "https://www.googleapis.com/books/v1/volumes";

  // Search books
  Future<List<BookModel>> fetchAllBooks({String? query}) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> items = data['items'] ?? [];
      return items.map((e) => BookModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load books");
    }
  }

  // Books by genre
  Future<List<BookModel>> fetchBooksByGenre(
    String genre, {
    int maxResults = 40,
    int startIndex = 0,
  }) async {
    final url =
        '$baseUrl?q=subject:$genre&maxResults=$maxResults&startIndex=$startIndex';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List items = data['items'] ?? [];
      return items.map((e) => BookModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load books for genre: $genre");
    }
  }
}
