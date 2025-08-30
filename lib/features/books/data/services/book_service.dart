import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class BookService {
  static const String baseUrl = "https://openlibrary.org";

  // Search books
  Future<List<BookModel>> fetchAllBooks({String query = "programming"}) async {
    final response = await http.get(Uri.parse('$baseUrl/search.json?q=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> docs = data['docs'] ?? [];
      return docs.map((e) => BookModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load books");
    }
  }

  // Books by genre
  Future<List<BookModel>> fetchBooksByGenre(String genre) async {
    final response = await http.get(Uri.parse('$baseUrl/subjects/$genre.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> works = data['works'] ?? [];
      return works.map((e) => BookModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load books by genre");
    }
  }

  // Get single book details
  Future<BookModel> fetchBookDetails(String workKey) async {
    final response = await http.get(Uri.parse('$baseUrl$workKey.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return BookModel.fromJson(data);
    } else {
      throw Exception("Failed to load book details");
    }
  }
}
