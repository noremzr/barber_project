import 'package:flutter/material.dart';
import 'package:flutter_app/Features/SplashScreen/splash_screen_controller.dart';
import 'package:flutter_app/Shared/base_colors.dart';
import 'package:flutter_app/Shared/base_svg_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenWidget extends StatefulWidget {
  final String initialRoute;
  const SplashScreenWidget({Key? key, required this.initialRoute})
      : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => SplashScreenController().redirectToLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                child: SizedBox(
                  height: 160,
                  child: SvgPicture.asset(
                    SvgIcons.barberIcon,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 6.0),
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
