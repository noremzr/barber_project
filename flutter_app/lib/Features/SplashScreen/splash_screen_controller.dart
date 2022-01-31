import 'package:flutter_app/Features/Login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenController {
  void redirectToLogin() {
    LoginController().hasUserLogged().then((value) {
      if (!value) {
        Modular.to.navigate('/login/');
      } else {
        Modular.to.navigate('/home/');
      }
    });
  }
}
