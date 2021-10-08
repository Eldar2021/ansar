import 'package:ansar/utils/serices_constants.dart';
import 'package:dio/dio.dart';

class LoginServices {
  Dio dio = Dio();

  Future<String> authSignIn(String username, String password) async {
    final response = await dio.post(ServiceConstants.loginUrl, data: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      final dynamic result = response.data;
      String token = result["auth_token"];
      return token;
    } else {
      throw Exception("your have error");
    }
  }

  Future authLogout() async {}
}
