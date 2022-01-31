import 'package:flutter/material.dart';
import 'package:flutter_app/Features/SplashScreen/splash_screen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Features/Home/home_module.dart';
import '../Features/Login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        LoginModule(),
        HomeModule(),
        SplashScreenModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: SplashScreenModule(),
        ),
      ];
}
