import 'package:flutter/material.dart';
import '../../data/models/book_model.dart';
import '../../../../core/widgets/remove_dialogue.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<List<BookModel>> {
  // Assuming you already have _favBox set up
  final _favBox;

  FavCubit(this._favBox) : super(_favBox.values.toList());

  bool isFavorite(BookModel book) {
    return _favBox.containsKey(book.id);
  }

  void addFavorite(BookModel book) {
    _favBox.put(book.id, book);
    emit(_favBox.values.toList());
  }

  void removeFavorite(BookModel book) {
    _favBox.delete(book.id);
    emit(_favBox.values.toList());
  }

  Future<void> toggleFavorite(BuildContext context, BookModel book) async {
    if (isFavorite(book)) {
      await showRemoveDialog(context, book, () => removeFavorite(book));
    } else {
      addFavorite(book);
    }
  }
}
