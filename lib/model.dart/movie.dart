// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  final String originalTitle;
  final String posterPath;
  final String overview;

  Movie(this.originalTitle, this.posterPath, this.overview);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'original_title': originalTitle,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      map['original_title'] as String,
      map['poster_path'] as String,
      map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
