import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Features/Users/user_model.dart';
import 'package:flutter_app/HttpService/api_base.dart';
import 'package:flutter_app/HttpService/http_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final String routeController = '/User';

  String retorno = "";

  Future<String> validateUser(UserModel user) async {
    final httpClient = HttpService();
    String route = "${ApiBase.route}$routeController/validate-user";
    final request = await httpClient.post(
      route,
      json.encode(user.toJson()),
    );
    String? loginValidation = request;
    if (loginValidation == null) {
      setUserSharedPreference(user);
    } else {
      retorno = loginValidation;
    }
    notifyListeners();
    return retorno;
  }

  void goToHome() {
    Modular.to.navigate('/home/');
  }

  void setUserSharedPreference(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('UserModel', jsonEncode(user.toJson()));
  }

  Future<UserModel> getUserSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(await jsonDecode(prefs.getString('UserModel')!));
  }

  Future<void> deleteUserSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('UserModel');
  }

  Future<bool> hasUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('UserModel');
    if (userString == null) {
      return false;
    }
    UserModel? user = UserModel.fromJson(jsonDecode(userString));
    if (user == null) {
      return false;
    }
    return true;
  }
}
