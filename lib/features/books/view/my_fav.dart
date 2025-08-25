import 'package:booky_library/core/widgets/custom_drawer.dart';
import 'package:booky_library/core/widgets/regular_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/book_model.dart';
import '../logic/cubit/fav_cubit.dart';
import '../widgets/book_card.dart';

class MyFav extends StatelessWidget {
  const MyFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: ''),
      appBar: RegularAppBar(
        title: "My Favorites",
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<FavCubit, List<BookModel>>(
        builder: (context, favs) {
          if (favs.isEmpty) {
            return const Center(child: Text("No favorites yet"));
          }
          return SafeArea(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: favs.length,
              itemBuilder: (context, index) {
                final book = favs[index];
                return BookCard(book: book);
              },
            ),
          );
        },
      ),
    );
  }
}
