import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/book_model.dart';

class FavCubit extends Cubit<List<BookModel>> {
  FavCubit() : super([]);

  void toggleFavorite(BookModel book) {
    if (state.contains(book)) {
      emit(state.where((b) => b.id != book.id).toList());
    } else {
      emit([...state, book]);
    }
  }

  bool isFavorite(BookModel book) {
    return state.any((b) => b.id == book.id);
  }
}
