import 'package:ansar/models/model_for_client/tariff_model.dart';
import 'package:ansar/screens/detail_screen.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';

class TariffDetailScreen extends StatelessWidget {
  const TariffDetailScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);
  final TariffModel doc;

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
            ClientRow(title: "Аталышы:", value: doc.name),
            ClientRow(title: "Түзүлгөн күнү :", value: "${doc.createdAt}"),
            ClientRow(title: "Оңдолгон күнү", value: "${doc.updatedAt}"),
            ClientRow(title: "Түзгөн колдонуучу", value: "${doc.userCreated.username}"),
            ClientRow(title: "Оңдогон колдонуучу", value: "${doc.userUpdated.username}"),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
