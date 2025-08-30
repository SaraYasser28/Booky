import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../logic/cubit/search_cubit.dart';
import '../../books/widgets/book_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Search books...",
            border: InputBorder.none,
          ),
          onChanged: (query) {
            searchCubit.searchBooks(query);
          },
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return const Center(child: Text("Type to search for books"));
          } else if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is SearchLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return BookCard(book: book);
              },
            );
          } else if (state is SearchError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
