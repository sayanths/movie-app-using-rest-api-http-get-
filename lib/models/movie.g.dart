// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      poster: json['poster_path'] as String?,
      title: json['original_title'] as String?,
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster_path': instance.poster,
      'overview': instance.overview,
      'original_title': instance.title,
    };
