import 'package:hive_flutter/hive_flutter.dart';
import '../models/book_model.dart';
import '../services/book_service.dart';

class BookRepository {
  final BookService _bookService;
  final Box<BookModel> _favBox;

  BookRepository(this._bookService, this._favBox);

  // Remote API
  Future<List<BookModel>> fetchAllBooks(String query) async {
    return await _bookService.fetchAllBooks(query: query);
  }

  Future<List<BookModel>> fetchBooksByGenre(String genre) async {
    return await _bookService.fetchBooksByGenre(genre);
  }

  Future<List<BookModel>> searchBooks(String query) async {
    return await _bookService.fetchAllBooks(query: query);
  }

  // Local Hive favorites
  Future<void> addFavorite(BookModel book) async {
    await _favBox.put(book.id, book);
  }

  Future<void> removeFavorite(BookModel book) async {
    await _favBox.delete(book.id);
  }

  List<BookModel> getFavoriteBooks() {
    return _favBox.values.toList();
  }

  bool isFavorite(BookModel book) {
    return _favBox.containsKey(book.id);
  }
}
