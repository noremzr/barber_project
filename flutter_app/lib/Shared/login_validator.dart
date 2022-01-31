import 'package:flutter_modular/flutter_modular.dart';

import '../Features/Login/login_controller.dart';

class AuthUserLoggedGuard extends RouteGuard {
  AuthUserLoggedGuard() : super(redirectTo: '/login');

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    return Modular.get<LoginController>().hasUserLogged();
  }
}
