import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends ChangeNotifier {
  String userName;
  String password;
  String? email;
  bool existe = false;
  String? completeName;
  bool? isBarber;
  num? latitude;
  num? longitude;
  String? streetName;

  UserModel(
      this.userName,
      this.password,
      this.email,
      this.existe,
      this.isBarber,
      this.completeName,
      this.latitude,
      this.longitude,
      this.streetName);

  UserModel.validation(this.userName, this.password, this.email);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
