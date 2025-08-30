import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../books/data/models/book_model.dart';
import '../../../books/data/repositories/book_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BookRepository bookRepository;

  SearchCubit(this.bookRepository) : super(SearchInitial());

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final books = await bookRepository.searchBooks(query);
      emit(SearchLoaded(books));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
