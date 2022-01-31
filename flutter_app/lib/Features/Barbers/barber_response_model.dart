import 'package:flutter_app/Features/Users/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'barber_response_model.g.dart';

@JsonSerializable()
class BarberResponseModel {
  List<UserModel> listaBarbeiros;

  BarberResponseModel(this.listaBarbeiros);

  // factory BarberResponseModel.fromJson(Map<String, dynamic> json) =>
  //     _$BarberResponseModelFromJson(json);
  // Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
