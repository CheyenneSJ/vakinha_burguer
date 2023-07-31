// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserModel {
  final int ud;
  final String name;
  final String email;

  UserModel(this.ud, this.name, this.email);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ud': ud,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['ud'] as int,
      map['name'] as String,
      map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
