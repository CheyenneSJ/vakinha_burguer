import 'dart:convert';


class AuthModel {
  final String acesseToken;

  AuthModel(this.acesseToken);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'acesseToken': acesseToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      map['acesseToken'] (map['access_token'] ??  '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
