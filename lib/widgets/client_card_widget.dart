import 'package:ansar/models/client_model.dart';
import 'package:ansar/screens/detail_screen.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/utils/text_style_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    Key? key,
    required this.clients,
  }) : super(key: key);

  final List<ClientModel> clients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: this.clients.length,
      itemBuilder: (BuildContext context, int index) {
        final item = this.clients[index];
        return InkWell(
          onTap: () {
            Get.to(DetailScreen(
              item: item,
              documents: item.documents,
              notesSet: item.notesSet,
              payments: item.payments,
            ));
          },
          child: MyContainer(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            borderRadius: 10,
            border: Border.all(
              color: MyColors.borderColor,
              width: 2.5,
            ),
            children: [
              ListTile(
                isThreeLine: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item.name}  ${item.lastName}",
                      style: MyTextStyle.cardItemName,
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: MyColors.cardIcon,
                    )
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildColumn("Документтер", "${item.documents.length}"),
                    buildColumn("Төлөмдөр", "${item.payments.length}"),
                    buildColumn("Эстөөлөр", "${item.notesSet.length}"),
                    buildColumn("Суроолор", "${item.questionnaires.length}"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column buildColumn(String length, String list) {
    return Column(
      children: [
        MyText(
          size: Get.width / 30,
          color: MyColors.cardIcon,
          textAlign: TextAlign.start,
          text: "$length",
        ),
        MyText(
          color: MyColors.cardIcon,
          textAlign: TextAlign.start,
          text: "$list",
        ),
      ],
    );
  }
}
