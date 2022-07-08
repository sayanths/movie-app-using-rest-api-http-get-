import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netlifx_cross/models/movie.dart';

class Service {
  static const _timeOut = Duration(seconds: 15);
  Future<List<Movie>> fetchAllMovies() async {
    final response = await http
        .get(
          Uri.parse(
              'https://api.themoviedb.org/3/trending/all/day?api_key=317f99eb865a587f6ec824c46f5db6a5'),
        )
        .timeout(_timeOut);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movie");
    }
  }
}
