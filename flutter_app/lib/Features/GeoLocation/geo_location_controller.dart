import 'package:dio/dio.dart';
import 'package:flutter_app/Features/GeoLocation/geo_location_model.dart';
import 'package:flutter_app/HttpService/http_service.dart';

class GeoLocationController {
  final String _routeController =
      "https://maps.googleapis.com/maps/api/geocode/json";

  final String _optionalParameters = '&limit=1&output=json';

  final String _apiKey = '5e9ca66b4c94514397e0cf903eb9af98';

  Future<dynamic> getGeoLocation(GeoLocationModel model) async {
    final httpClient = HttpService();
    String route =
        "$_routeController?latlng=-${model.latitude},${model.longitude}&key=AIzaSyCOQbXC3Zs2kmm6f8hem0aXj_2T-PYZtkM";
    Response request = await httpClient.get(
      route,
    );
    print(request.data);
    // GeoLocationResponseModel response = GeoLocationResponseModel.fromJson(
    // Map<String, dynamic>.from(request.data));

    // return response;
    return dynamic;
  }
}
