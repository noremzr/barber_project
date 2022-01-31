import 'package:flutter/material.dart';
import 'package:flutter_app/AppComponent/app_module.dart';
import 'package:flutter_app/Features/SplashScreen/splash_screen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'AppComponent/app_widget.dart';
import 'Features/Login/login_controller.dart';
import 'Features/SplashScreen/splash_screen_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: ChangeNotifierProvider(
        create: (_) => LoginController(),
        child: const AppWidget(),
      ),
    ),
  );
}
