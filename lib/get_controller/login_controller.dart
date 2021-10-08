import 'package:ansar/screens/client_screen.dart';
import 'package:ansar/screens/home_screen.dart';
import 'package:ansar/screens/auth_screen/login_screen.dart';
import 'package:ansar/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  RxString state = "".obs;
  final box = GetStorage();
  LoginServices loginServices = LoginServices();

  Future getLogin() async {
    try {
      Get.defaultDialog(content: CircularProgressIndicator());
      var token = box.read("login");
      Get.back();
      if (token.isNotEmpty) {
        Get.to(() => ClientScreen());
      } else {
        Get.to(() => LoginScreen());
      }
    } catch (e) {
      print(e);
      Get.to(() => LoginScreen());
    }
  }

  Future<void> authController(String username, String password) async {
    try {
      Get.defaultDialog(content: CircularProgressIndicator());
      String token = await loginServices.authSignIn(username, password);
      box.write('login', token);
      Get.back();
      Get.off(() => ClientScreen());
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "$e");
      print(e);
    }
  }

  Future<void> logOutController() async {
    try {
      Get.defaultDialog(content: CircularProgressIndicator());
      box.remove('login');
      await loginServices.authLogout();
      Get.back();
      Get.off(() => HomeScreen());
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "$e");
      print(e);
    }
  }
}
