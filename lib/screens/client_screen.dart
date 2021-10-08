import 'package:ansar/get_controller/client_controller.dart';
import 'package:ansar/get_controller/login_controller.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/client_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final LoginController loginController = Get.find();
  final ClientController clientController = Get.put(ClientController());

  @override
  void initState() {
    clientController.getClients();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          clientController.getClients();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Obx(() {
                if (clientController.clients.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else if (clientController.clients.isNotEmpty) {
                  return ClientCard(clients: clientController.clients);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "Ansar Group",
        style: TextStyle(color: MyColors.borderColor),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            loginController.logOutController();
          },
          icon: Icon(
            Icons.logout,
            color: MyColors.borderColor,
          ),
        )
      ],
    );
  }
}
