import 'package:json_annotation/json_annotation.dart';


part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'poster_path')
  final String? poster;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'original_title')
  final String? title;


  Movie({
    required this.poster,
    required this.title,
    required this.overview,
   
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);

    // return Movie(
    //     poster: json["poster_path"],
    //     title: json["name"],
    //     overview: json["overview"],
    //     rating: json["vote_average"]);
  }
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
