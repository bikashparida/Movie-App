import 'package:flutter/material.dart';
import 'package:movieapp/features/home_screen/provider/movie_provider.dart';
import 'package:provider/provider.dart';
import '../../home_screen/widget/movie_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        centerTitle: true,
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          if (value.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return MovieListView(
            notifier: value,
            type: 'favorites',
          );
        },
      ),
    );
  }
}
