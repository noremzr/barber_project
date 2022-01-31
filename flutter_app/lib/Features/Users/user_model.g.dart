// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['userName'] as String,
      json['password'] as String,
      json['email'] as String?,
      json['existe'] as bool,
      json['isBarber'] as bool?,
      json['completeName'] as String?,
      json['latitude'] as num?,
      json['longitude'] as num?,
      json['streetName'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'existe': instance.existe,
      'completeName': instance.completeName,
      'isBarber': instance.isBarber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'streetName': instance.streetName,
    };
