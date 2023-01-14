// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PopularPerson {
  final String name;
  final String profilepath;
  final String knownfordepartment;

  PopularPerson(this.name, this.profilepath, this.knownfordepartment);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profile_path': profilepath,
      'known_for_department': knownfordepartment,
    };
  }

  factory PopularPerson.fromMap(Map<String, dynamic> map) {
    return PopularPerson(
      map['name'] as String,
      map['profile_path'] as String,
      map['known_for_department'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularPerson.fromJson(String source) =>
      PopularPerson.fromMap(json.decode(source) as Map<String, dynamic>);
}
