import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_state.dart';
import '../../data/repositories/book_repository.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepository repository;

  BookCubit(this.repository) : super(BookInitial());

  /// Fetch all books
  Future<void> fetchAllBooks() async {
    emit(BookLoading());
    try {
      final books = await repository.fetchAllBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  /// Fetch books by genre
  Future<void> fetchBooksByGenre(String genre) async {
    emit(BookLoading());
    try {
      final books = await repository.fetchBooksByGenre(genre);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  /// Fetch favorite books
  Future<void> fetchFavoriteBooks(List<int> favoriteIds) async {
    emit(BookLoading());
    try {
      final books = await repository.fetchFavoriteBooks(favoriteIds);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
