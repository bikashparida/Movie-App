import 'package:flutter/foundation.dart';
import 'package:movieapp/data/repository/sql_helper.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movieapp/constant.dart';
import 'package:movieapp/data/model/movie_model.dart';

final tmdbWithCustomLogs = TMDB(
  ApiKeys(apiKey, accessToken),
  logConfig: const ConfigLogger(
    showLogs: true,
    showErrorLogs: true,
  ),
);

Future<List<MovieModel>> getData() async {
  try {
    final response = await tmdbWithCustomLogs.v3.movies.getTopRated();
    List<MovieModel> list = [];
    List<Map<String, dynamic>> favList = await SQLHelper.getItems();
    List<MovieModel> favorite =
        favList.map((e) => MovieModel.fromMap(e)).toList();
    for (var value in response['results']) {
      if (favorite.any((element) => element.id == value['id'] as int)) {
        var updatedOne = MovieModel.fromMap(value);
        updatedOne.isChecked = true;
        list.add(updatedOne);
      } else {
        list.add(MovieModel.fromMap(value));
      }
    }
    return list;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return [];
}

Future<List<MovieModel>> getSearchData(String movieName) async {
  try {
    final response = await tmdbWithCustomLogs.v3.search.queryMovies(movieName);
    List<MovieModel> searchList = [];
    List<Map<String, dynamic>> favList = await SQLHelper.getItems();
    List<MovieModel> favorite =
        favList.map((e) => MovieModel.fromMap(e)).toList();
    for (var value in response['results']) {
      if (favorite.any((element) => element.id == value['id'] as int)) {
        var updatedOne = MovieModel.fromMap(value);
        updatedOne.isChecked = true;
        searchList.add(updatedOne);
      } else {
        searchList.add(MovieModel.fromMap(value));
      }
    }
    return searchList;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return [];
  }
}
