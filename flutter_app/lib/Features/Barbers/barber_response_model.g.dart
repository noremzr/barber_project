// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarberResponseModel _$BarberResponseModelFromJson(Map<String, dynamic> json) =>
    BarberResponseModel(
      (json['listaBarbeiros'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BarberResponseModelToJson(
        BarberResponseModel instance) =>
    <String, dynamic>{
      'listaBarbeiros': instance.listaBarbeiros,
    };
