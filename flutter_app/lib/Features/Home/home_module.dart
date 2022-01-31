import 'package:flutter_app/Features/Home/home_widget.dart';
import 'package:flutter_app/Features/Login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        LoginModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomeWidget(),
        ),
      ];
}
