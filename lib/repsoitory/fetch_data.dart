import 'dart:convert';

import 'package:instantsy/model.dart/movie.dart';
import 'package:http/http.dart' as http;
import 'package:instantsy/model.dart/popular_person.dart';
import 'package:instantsy/model.dart/tv_show.dart';
import 'package:instantsy/utils.dart';

class FetchData {
  //Future<List<Movie>>
  Future<dynamic> fetchMovies() async {
    final url = base_url + 'movie/popular?api_key=' + api_key;
    final response = await http.get(Uri.parse(url));
    final movieData = jsonDecode(response.body)['results'];
    final movies = movieData.map((e) => Movie.fromMap(e)).toList();

    print(movies[0].originalTitle);

    return movies;
  }

  Future<dynamic> fetchShows() async {
    final url = base_url + 'tv/popular?api_key=' + api_key;
    final response = await http.get(Uri.parse(url));
    final showData = jsonDecode(response.body)['results'];
    final shows = showData.map((e) => TvShow.fromMap(e)).toList();

    return shows;
  }

  Future<dynamic> fetchPerson() async {
    final url = base_url + 'person/popular?api_key=' + api_key;
    final response = await http.get(Uri.parse(url));
    final personData = jsonDecode(response.body)['results'];
    final persons = personData.map((e) => PopularPerson.fromMap(e)).toList();

    return persons;
  }
}
