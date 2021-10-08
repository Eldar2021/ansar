import 'package:ansar/models/client_model.dart';
import 'package:ansar/screens/detail_screen.dart';
import 'package:ansar/services/web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  WebService webService = WebService();

  RxList<ClientModel> clients = <ClientModel>[].obs;
  // late Rx<ClientModel> clientModel;

  void getClients() async {
    try {
      clients.value = await webService.getClients();
    } catch (e) {
      Get.defaultDialog(content: Text("$e"));
      print(e);
    }
  }

  Future<ClientModel?> getClientsBuId(int id) async {
    try {
      ClientModel clientModel = await webService.getClientById(id);
      return clientModel;
    } catch (e) {
      Get.defaultDialog(content: Text("$e"));
      print(e);
    }
  }
}
