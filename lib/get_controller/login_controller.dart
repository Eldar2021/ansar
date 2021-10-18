import 'package:ansar/screens/client_screen.dart';
import 'package:ansar/screens/home_screen.dart';
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
      var token = box.read('login');
      if (token.isNotEmpty) {
        Get.offAll(() => ClientScreen());
      } else {
        Get.offAll(() => HomeScreen());
      }
    } catch (e) {
      Get.offAll(() => HomeScreen());
    }
  }

  Future<void> authController(String username, String password) async {
    try {
      Get.defaultDialog(content: CircularProgressIndicator(), title: "Текшерилүүдө");
      String token = await loginServices.authSignIn(username, password);
      box.write('login', token);
      Get.back();
      Get.offAll(() => ClientScreen());
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "Ката", middleText: "Кирүү логининиңиз же сыр сөзүңүз ката бар");
    }
  }

  Future<void> logOutController() async {
    Get.defaultDialog(
        title: "Колдонуучу логинден чыгуу",
        middleText:
            " Логинден чыгууну кааласыңыз Ооба баскычын, артка кайтуу үчүн Жок баскычын басыңыз.",
        textCancel: "Жок",
        textConfirm: "Ооба",
        onCancel: () {
          Get.back();
        },
        onConfirm: () async {
          try {
            Get.defaultDialog(content: CircularProgressIndicator(), title: "Аткарылууда");
            box.remove('login');
            await loginServices.authLogout();
            Get.back();
            Get.offAll(() => HomeScreen());
          } catch (e) {
            Get.back();
            Get.defaultDialog(title: "Процесс аткарылган жок");
            print(e);
          }
        });
  }
}
