import 'package:ansar/models/client_list_model/payment_model.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../detail_screen.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final Payments doc;

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
            ClientRow(title: "Төлөндү:", value: "${doc.money}"),
            ClientRow(title: "Түзүлгөн күнү :", value: "${doc.createdAt}"),
            ClientRow(title: "Оңдолгон күнү", value: "${doc.updatedAt}"),
            ClientRow(title: "Клиент ID номери", value: "${doc.client}"),
            ClientRow(title: "Түзгөн колдонуучу", value: "${doc.userCreated.username}"),
            ClientRow(title: "Оңдогон колдонуучу", value: "${doc.userUpdated.username}"),
            SizedBox(height: 30),
            if (doc.payments.endsWith("pdf"))
              Container(
                height: 500,
                width: double.infinity,
                child: SfPdfViewer.network(
                  "${doc.payments}",
                  scrollDirection: PdfScrollDirection.horizontal,
                ),
              )
            else
              MyContainer(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${doc.payments}",
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
