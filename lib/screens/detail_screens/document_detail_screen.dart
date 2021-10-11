import 'package:ansar/models/client_list_model/document_model.dart';
import 'package:ansar/screens/detail_screen.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentDetailScreen extends StatelessWidget {
  const DocumentDetailScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);
  final Documents doc;

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
            ClientRow(title: "Клиент ID номери", value: "${doc.client}"),
            ClientRow(title: "Түзгөн колдонуучу", value: "${doc.userCreated.username}"),
            ClientRow(title: "Оңдогон колдонуучу", value: "${doc.userUpdated.username}"),
            SizedBox(height: 30),
            if (doc.documents.endsWith("png") || doc.documents.endsWith("jpg"))
              MyContainer(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${doc.documents}",
                  ),
                ],
              )
            else if (doc.documents.endsWith("pdf"))
              Container(
                height: 500,
                width: double.infinity,
                child: SfPdfViewer.network("${doc.documents}", scrollDirection: PdfScrollDirection.horizontal,),
              )
            else
              Text("${doc.documents}"),
          ],
        ),
      ),
    );
  }
}
