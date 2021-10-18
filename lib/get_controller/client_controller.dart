import 'package:ansar/models/client_model.dart';
import 'package:ansar/services/hive_services.dart';
import 'package:ansar/services/web_services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  WebService webService = WebService();
  HiveService hiveService = HiveService();
  Connectivity connectivity = Connectivity();

  RxList clients = <dynamic>[].obs;

  void getClients() async {
    try {
      bool isExist = await hiveService.isExists(boxName: "NewsModel");
      if (isExist == true) {
        List<dynamic> response = await hiveService.getBoxes("NewsModel");
        clients.value = response;
        print("data is hive");
      } else {
        clients.value = await webService.getClients();
        await hiveService.addBoxes(clients, "NewsModel");
        print("data is web");
      }
    } catch (e) {
      Get.defaultDialog(content: Text("Интренет байланышында ката бар"), title: "Ката");
      print(e);
    }
  }

  Future<void> internet() async {
    try {
      ConnectivityResult result = await connectivity.checkConnectivity();
      print("results $result");
      if (result == ConnectivityResult.wifi) {
        hiveService.clearBoxes("NewsModel");
        clients.value = await webService.getClients();
        await hiveService.addBoxes(clients, "NewsModel");
        print("data is web");
      } else if (result == ConnectivityResult.mobile) {
        hiveService.clearBoxes("NewsModel");
        clients.value = await webService.getClients();
        await hiveService.addBoxes(clients, "NewsModel");
        print("data is web");
      } else if (result == ConnectivityResult.none){
        try {
          bool isExist = await hiveService.isExists(boxName: "NewsModel");
          if (isExist == true) {
            List<dynamic> response = await hiveService.getBoxes("NewsModel");
            clients.value = response;
            print("data is hive");
          }else{
            Get.defaultDialog(content: Text("Интренет байланышында ката бар"), title: "Ката");
            print(isExist);
          }
        } catch (e) {
          print("kataaa $e");
        }
      }
    } catch (e) {
      try {
        bool isExist = await hiveService.isExists(boxName: "NewsModel");
        if (isExist == true) {
          List<dynamic> response = await hiveService.getBoxes("NewsModel");
          clients.value = response;
          print("data is hive");
        }else{
          Get.defaultDialog(content: Text("Интренет байланышында ката бар"), title: "Ката");
          print(isExist);
        }
      } catch (e) {
        print("kataaa $e");
      }
      print("kataaa $e");
    }
  }

  Future<ClientModel?> getClientsBuId(int id) async {
    try {
      ClientModel clientModel = await webService.getClientById(id);
      return clientModel;
    } catch (e) {
      Get.defaultDialog(content: Text("Интренет байланышында ката бар"), title: "Ката");
      print(e);
    }
  }
}
