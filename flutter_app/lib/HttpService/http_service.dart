import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart';
import 'ihttp_service.dart';

class HttpService implements IHtppService {
  HttpService();

  @override
  Future<Response> get(String url) async {
    var response = await Dio()
        .get(url, options: Options(contentType: ContentType.json.toString()));

    return response;
  }

  @override
  Future post(String url, dynamic obj) async {
    (await Dio().post(url, data: obj)).data;
  }

  @override
  Future put(String url, dynamic obj) async =>
      (await Dio().put(url, data: obj)).data;

  @override
  Future delete(String url) async => (await Dio().delete(url)).data;
}
