import 'package:flutter_bloc/flutter_bloc.dart';

class RatingCubit extends Cubit<Map<String, double>> {
  RatingCubit() : super({});

  void rateBook(String bookId, double rating) {
    final newState = Map<String, double>.from(state);
    newState[bookId] = rating;
    emit(newState);
  }

  double getRating(String bookId) => state[bookId] ?? 0;
}
