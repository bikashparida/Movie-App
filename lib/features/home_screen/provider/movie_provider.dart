import 'package:flutter/material.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/data/repository/sql_helper.dart';

import '../../../data/model/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  bool isLoading = true;
  List<MovieModel> topRated = [];
  List<MovieModel> favorite = [];
  List<MovieModel> searchedMovies = [];

  Future<void> getSortedByYear() async {
    topRated.sort((a, b) => b.releaseDate!.compareTo(a.releaseDate!));
    notifyListeners();
  }

  Future<void> getSortedByPopularity() async {
    topRated.sort((a, b) => b.popularity!.compareTo(a.popularity!));
    notifyListeners();
  }

  Future<void> getSortedByRating() async {
    topRated.sort((a, b) => b.voteAverage!.compareTo(a.voteAverage!));
    notifyListeners();
  }

  Future<void> getMovieData() async {
    topRated = await getData();
    favorite = topRated.where((element) => element.isChecked == true).toList();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getSearchMovie(String value) async {
    searchedMovies = await getSearchData(value);
    isLoading = false;
    notifyListeners();
  }

  void addMovie(MovieModel movieModel, int index) async {
    if (!favorite.contains(movieModel)) {
      favorite.add(movieModel);
      await SQLHelper.createItem(movieModel);
      topRated.removeAt(index);
      var updatedMovie = movieModel;
      updatedMovie.isChecked = true;
      topRated.insert(index, updatedMovie);
      notifyListeners();
    }
  }

  void removeMovie(MovieModel movie, int index) async {
    await SQLHelper.deleteItem(movie.id!);
    favorite.removeWhere((element) => element.id == movie.id);
    topRated.removeAt(index);
    var updatedMovie = movie;
    updatedMovie.isChecked = false;
    topRated.insert(index, updatedMovie);
    notifyListeners();
  }
}
