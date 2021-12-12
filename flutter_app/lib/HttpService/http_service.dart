import 'dart:convert';
import 'ihttp_service.dart';

import 'package:http/http.dart' as http;

class HttpService implements IHtppService {
  final http.Client client;

  HttpService(this.client);

  @override
  Future get(String url) async =>
      jsonDecode((await client.get(Uri(path: url))).body);

  @override
  Future post(String url, dynamic obj) async => jsonDecode(
      (await client.post(Uri(path: url), body: jsonEncode(obj))).body);

  @override
  Future put(String url, dynamic obj) async => jsonDecode(
      (await client.put(Uri(path: url), body: jsonEncode(obj))).body);

  @override
  Future delete(String url) async =>
      jsonDecode((await client.delete(Uri(path: url))).body);
}
