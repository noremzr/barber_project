import 'package:flutter_app/Features/Login/login_model.dart';
import 'package:universal_io/io.dart';

enum LoginResponse { ok, notfound, error }

class LoginController {
  final String routeController = 'User';

  Future<LoginResponse> validateUser(UserModel login) async {
    final httpClient = HttpClient();
    final request = await httpClient.postUrl(
      Uri.parse("https//127.0.0.1:5200/User/validate-user"),
    );

    if (request is BrowserHttpClientRequest) {
      request.browserCredentialsMode = true;
    }
    final response = await request.close();

    return LoginResponse.ok;
  }
}
