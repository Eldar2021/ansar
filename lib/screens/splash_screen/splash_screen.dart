import 'dart:async';

import 'package:ansar/get_controller/login_controller.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  initState(){
    // TODO: implement initState
    super.initState();
   eldar();
  }

  Future<void> eldar() async {
    await Future.delayed(Duration(seconds: 1));
    await loginController.getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Expanded(child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
