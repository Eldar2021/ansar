import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';

import '../detail_screen.dart';
class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final UserCrud doc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.containerBack,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: MyContainer(
          padding: const EdgeInsets.all(20),
          color: Colors.transparent,
          children: [
            ClientRow(title: "Колдонуучу аты:", value: doc.username),
            ClientRow(title: "Аты:", value: "${doc.firstName}"),
            ClientRow(title: "Фамилиясы", value: "${doc.lastName}"),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
