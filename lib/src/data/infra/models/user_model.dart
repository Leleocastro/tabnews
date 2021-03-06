import 'dart:convert';

class UserModel {
  final String id;
  final String username;
  final String token;
  final List<String> features;

  const UserModel({
    required this.id,
    required this.username,
    required this.token,
    required this.features,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'features': features,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      token: map['token'] ?? '',
      features: List<String>.from(map['features'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
