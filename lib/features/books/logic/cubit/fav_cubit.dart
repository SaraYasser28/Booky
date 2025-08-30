import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/book_model.dart';

class FavCubit extends Cubit<List<BookModel>> {
  final Box<BookModel> _favBox;

  FavCubit(this._favBox) : super([]) {
    emit(_favBox.values.toList());
  }

  void toggleFavorite(BookModel book) {
    if (isFavorite(book)) {
      _favBox.delete(book.id);
    } else {
      _favBox.put(book.id, book);
    }
    emit(_favBox.values.toList());
  }

  bool isFavorite(BookModel book) {
    return _favBox.containsKey(book.id);
  }

  List<BookModel> getFavorites() {
    return _favBox.values.toList();
  }
}
