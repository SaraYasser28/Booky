import '../models/book_model.dart';
import '../services/book_service.dart';

class BookRepository {
  final BookService _bookService;

  BookRepository(this._bookService);

  // Fetch all books
  Future<List<BookModel>> fetchAllBooks() async {
    await Future.delayed(const Duration(seconds: 2));
    return _bookService.books;
  }

  // Fetch books by genre
  Future<List<BookModel>> fetchBooksByGenre(String genre) async {
    await Future.delayed(const Duration(milliseconds: 800));

    String normalize(String s) => s.replaceAll(" ", "").toLowerCase();

    return _bookService.books
        .where((book) => normalize(book.genre) == normalize(genre))
        .toList();
  }

  // Fetch favorite books
  Future<List<BookModel>> fetchFavoriteBooks(List<int> favoriteIds) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _bookService.books
        .where((book) => favoriteIds.contains(book.id))
        .toList();
  }
}
