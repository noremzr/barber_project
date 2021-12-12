import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);
  static const String _title = 'Login';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 99, 194, 209)),
      title: _title,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                    child: SizedBox(
                      height: 160,
                      child: SvgPicture.asset('barber.svg',
                          semanticsLabel: 'A red up arrow'),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 131, 214, 227),
                      prefixIcon: SizedBox(
                        height: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset('email.svg',
                              color: const Color.fromARGB(255, 38, 133, 150)),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: 'Usuário',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 131, 214, 227),
                        prefixIcon: SizedBox(
                          height: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(
                              'lock.svg',
                              color: const Color.fromARGB(255, 38, 133, 150),
                            ),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        labelText: 'Senha',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 38, 133, 150)),
                        ),
                        onPressed: () => {},
                        child: const Text('Login'),
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
