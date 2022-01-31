import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Shared/base_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme:
          ThemeData(scaffoldBackgroundColor: BaseColors.screensBackgroundColor),
    ).modular();
  }
}
