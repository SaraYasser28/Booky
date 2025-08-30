part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<BookModel> books;
  SearchLoaded(this.books);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
