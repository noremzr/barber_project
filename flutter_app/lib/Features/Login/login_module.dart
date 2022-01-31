import 'package:flutter_app/Features/Home/home_module.dart';
import 'package:flutter_app/Features/Login/login_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const LoginWidget(),
        ),
      ];
}
