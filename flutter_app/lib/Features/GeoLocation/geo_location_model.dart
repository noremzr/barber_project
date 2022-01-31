import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GeoLocationModel extends ChangeNotifier {
  double latitude;
  double longitude;

  GeoLocationModel(this.latitude, this.longitude);
}
