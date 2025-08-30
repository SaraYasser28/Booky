import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class BookService {
  static const String baseUrl = "https://www.googleapis.com/books/v1/volumes";
  final Dio _dio = Dio();

  // Search books (Google Books API)
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
  Future<List<BookModel>> fetchBooksByGenre(String genre) async {
    try {
      final response = await _dio.get(
        baseUrl,
        queryParameters: {"q": "subject:$genre", "maxResults": 30},
      );

      final items = response.data['items'] as List? ?? [];
      return items.map((e) => BookModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to fetch books: $e");
    }
  }
}
