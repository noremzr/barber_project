import 'dart:convert';

class UserModel {
  String userName;
  String password;
  String email;

  UserModel(
    this.userName,
    this.password,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['userName'] ?? '',
      map['password'] ?? '',
      map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
