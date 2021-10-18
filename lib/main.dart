import 'dart:async';
import 'package:ansar/models/client_list_model/document_model.dart';
import 'package:ansar/models/client_list_model/note_model.dart';
import 'package:ansar/models/client_list_model/payment_model.dart';
import 'package:ansar/models/client_model.dart';
import 'package:ansar/models/model_for_client/city_model.dart';
import 'package:ansar/models/model_for_client/tariff_model.dart';
import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:ansar/screens/splash_screen/splash_screen.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    final appDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
  }
  Hive.registerAdapter(ClientModelAdapter());
  Hive.registerAdapter(DocumentsAdapter());
  Hive.registerAdapter(PaymentsAdapter());
  Hive.registerAdapter(NotesSetAdapter());
  Hive.registerAdapter(CityModelAdapter());
  Hive.registerAdapter(TariffModelAdapter());
  Hive.registerAdapter(UserCrudAdapter());
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
