
import 'package:flutter/material.dart';

import 'package:netlifx_cross/models/movie.dart';

class MovieWidget extends StatelessWidget {
  final List<Movie> movies;
  const MovieWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: ((context, index) {
          final movie = movies[index];
          return ListTile(
            leading: Text(movie.title??"loading"),
          );
        }));
  }
}
