import 'dart:convert';

class LoginModel {
  String userName;
  String password;
  String email;

  LoginModel(
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

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      map['userName'] ?? '',
      map['password'] ?? '',
      map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
