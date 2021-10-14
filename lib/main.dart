import 'dart:async';
import 'package:ansar/get_controller/login_controller.dart';
import 'package:ansar/screens/home_screen.dart';
import 'package:ansar/screens/splash_screen/splash_screen.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.primaryColor,
      ),
      home: SplashScreen(),
    );
  }
}
