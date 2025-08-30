import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_state.dart';
import '../../data/repositories/book_repository.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepository repository;

  BookCubit(this.repository) : super(BookInitial());

  Future<void> fetchAllBooks(String query) async {
    emit(BookLoading());
    try {
      final books = await repository.fetchAllBooks(query);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> fetchBooksByGenre(String genre) async {
    emit(BookLoading());
    try {
      final books = await repository.fetchBooksByGenre(genre);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> fetchFavoriteBooks() async {
    emit(BookLoading());
    try {
      final books = repository.getFavoriteBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
