import 'package:flutter_app/Features/Home/home_module.dart';
import 'package:flutter_app/Features/Login/login_widget.dart';
import 'package:flutter_app/Features/SplashScreen/splash_screen_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Login/login_module.dart';

class SplashScreenModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
        HomeModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) =>
              SplashScreenWidget(initialRoute: Modular.initialRoute),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
