import 'package:flutter/material.dart';
import 'package:flutter_app/Components/custom_text_form_field.dart';
import 'package:flutter_app/Features/Login/login_controller.dart';
import 'package:flutter_app/Features/Login/login_model.dart';
import 'package:flutter_app/Shared/base_colors.dart';
import 'package:flutter_app/Shared/base_svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  LoginController controller = LoginController();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(scaffoldBackgroundColor: BaseColors.screensBackgroundColor),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
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
                  SizedBox(
                    width: window.physicalSize.width / 1.2,
                    height: 70,
                    child: CustomTextFormField(
                      controller: userController,
                      placeholder: 'Usuário',
                      height: 70,
                      iconPath: SvgIcons.emailIcon,
                      svgIconColor: BaseColors.backGroundColor,
                      backGroundColor: BaseColors.textFieldBackgroundColor,
                      width: window.physicalSize.width / 1.2,
                      validator: (String? value) {
                        return (value!.isEmpty == true)
                            ? 'Digite a senha'
                            : null;
                      },
                      borderRadius: 30.0,
                      passwordTextType: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                    child: SizedBox(
                      height: 70,
                      width: window.physicalSize.width / 1.2,
                      child: CustomTextFormField(
                        controller: passwordController,
                        placeholder: 'Senha',
                        height: 70,
                        width: window.physicalSize.width / 1.2,
                        iconPath: SvgIcons.lockIcon,
                        svgIconColor: BaseColors.backGroundColor,
                        backGroundColor: BaseColors.textFieldBackgroundColor,
                        borderRadius: 30.0,
                        passwordTextType: true,
                        validator: (String? value) {
                          return (value!.isEmpty == true)
                              ? 'Digite a senha'
                              : null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: SizedBox(
                      width: window.physicalSize.width / 1.2,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              BaseColors.backGroundColor),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller
                                .validateUser(UserModel(userController.text,
                                    passwordController.text, ''))
                                .then((value) {
                              debugPrint(value.toString());
                            });
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                    child: Center(
                      child: InkWell(
                        onTap: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Ainda não possui conta? ',
                              style: TextStyle(
                                  color: BaseColors.textFieldBackgroundColor),
                            ),
                            const Text(
                              'Cadastre-se',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
