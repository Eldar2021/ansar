import 'package:ansar/models/client_list_model/note_model.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';

import '../detail_screen.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);
  final NotesSet doc;

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
            ClientRow(title: "Түзүлгөн күнү :", value: "${doc.createdAt}"),
            ClientRow(title: "Оңдолгон күнү", value: "${doc.updatedAt}"),
            ClientRow(title: "Клиент ID номери", value: "${doc.client}"),
            ClientRow(title: "Түзгөн колдонуучу", value: "${doc.userCreated.username}"),
            ClientRow(title: "Оңдогон колдонуучу", value: "${doc.userUpdated.username}"),
            SizedBox(height: 30),
            MyText(
              text: "Тексти",
              color: MyColors.myWhite,
              size: 36,
            ),
            MyText(
              text: "${doc.message}",
              color: MyColors.myWhite,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
