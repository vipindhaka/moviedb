// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TvShow {
  final String name;
  final String posterPath;
  final String overview;

  TvShow(this.name, this.posterPath, this.overview);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  factory TvShow.fromMap(Map<String, dynamic> map) {
    return TvShow(
      map['name'] as String,
      map['poster_path'] as String,
      map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TvShow.fromJson(String source) =>
      TvShow.fromMap(json.decode(source) as Map<String, dynamic>);
}
