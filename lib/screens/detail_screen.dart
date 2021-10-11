import 'package:ansar/get_controller/client_controller.dart';
import 'package:ansar/models/client_model.dart';
import 'package:ansar/screens/detail_screens/city_detail_screen.dart';
import 'package:ansar/screens/detail_screens/document_detail_screen.dart';
import 'package:ansar/screens/detail_screens/notes_detaol_screens.dart';
import 'package:ansar/screens/detail_screens/paymant_detail_screen.dart';
import 'package:ansar/screens/detail_screens/tariff_detail_screen.dart';
import 'package:ansar/screens/detail_screens/uder_detail_screen.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/utils/text_style_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  DetailScreen({
    required this.item,
    this.documents,
    this.notesSet,
    this.payments,
    Key? key,
  }) : super(key: key);

  ClientModel item;
  List<dynamic>? documents;
  List<dynamic>? notesSet;
  List<dynamic>? payments;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ClientController clientController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ClientModel clientModel = (await clientController.getClientsBuId(widget.item.id))!;
          widget.item = clientModel;
          widget.documents = clientModel.documents;
          widget.notesSet = clientModel.notesSet;
          widget.payments = clientModel.payments;
          setState(() {});
        },
        child: SingleChildScrollView(
          child: MyContainer(
            padding: const EdgeInsets.all(20),
            color: MyColors.containerBack,
            children: [
              MyContainer(
                color: Colors.transparent,
                children: [
                  // widget.item.contractAt
                  ClientRow(title: "Аты :", value: widget.item.name),
                  ClientRow(title: "Ф.О.И :", value: widget.item.lastName),
                  ClientRow(title: "Акчасы :", value: "${widget.item.totalMoney}"),
                  ClientRow(title: "Контрактын Болгон күнү", value: "${widget.item.contractAt}"),
                  ClientRow(title: "Түзүлгөн күн", value: widget.item.createdAt),
                  ClientRow(title: "Оңдолгон күн", value: widget.item.updatedAt),
                  ClientRow(title: "Статус", value: widget.item.status),
                  ClientRow(title: "Бүтүү күнү", value: widget.item.endAt),
                  ClientRow(
                      title: "Биринчи тологон күнү", value: "${widget.item.firstPaymentsEndAt}"),
                ],
              ),
              const SizedBox(height: 20),
              widget.item.documents.isNotEmpty
                  ? MyContainer(
                      color: Colors.transparent,
                      children: [
                        MyText(text: "Документы", size: Get.width / 15),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: widget.item.documents.length,
                          itemBuilder: (context, index) {
                            final dynamic doc = widget.item.documents[index];
                            return MyContainer(
                              margin: const EdgeInsets.only(top: 10, bottom: 10),
                              borderRadius: 10,
                              border: Border.all(
                                color: MyColors.borderColor,
                                width: 1.5,
                              ),
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.to(DocumentDetailScreen(doc: doc));
                                  },
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " ${index + 1}  ${doc.name}",
                                        style: MyTextStyle.cardItemName,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        color: MyColors.cardIcon,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(),
              widget.item.notesSet.isNotEmpty
                  ? MyContainer(
                      color: Colors.transparent,
                      children: [
                        MyText(text: "Эстөөлөр", size: Get.width / 15),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: widget.item.notesSet.length,
                          itemBuilder: (context, index) {
                            final dynamic doc = widget.item.notesSet[index];
                            return MyContainer(
                              margin: const EdgeInsets.only(top: 10, bottom: 10),
                              borderRadius: 10,
                              border: Border.all(
                                color: MyColors.borderColor,
                                width: 1.5,
                              ),
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.to(NoteDetailScreen(doc: doc));
                                  },
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          " ${index + 1}  ${doc.message}",
                                          style: MyTextStyle.cardItemName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        color: MyColors.cardIcon,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(height: 30),
              widget.item.payments.isNotEmpty
                  ? MyContainer(
                      color: Colors.transparent,
                      children: [
                        MyText(text: "Төлөмдөр", size: Get.width / 15),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: widget.item.payments.length,
                          itemBuilder: (context, index) {
                            final dynamic doc = widget.item.payments[index];
                            return MyContainer(
                              margin: const EdgeInsets.only(top: 10, bottom: 10),
                              borderRadius: 10,
                              border: Border.all(
                                color: MyColors.borderColor,
                                width: 1.5,
                              ),
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.to(PaymentDetailScreen(doc: doc));
                                  },
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          " ${index + 1}  ${doc.name}",
                                          style: MyTextStyle.cardItemName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        color: MyColors.cardIcon,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Шаар", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    borderRadius: 10,
                    border: Border.all(
                      color: MyColors.borderColor,
                      width: 1.5,
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(CityDetailScreen(doc: widget.item.city));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.item.city.name}",
                                style: MyTextStyle.cardItemName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: MyColors.cardIcon,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Тариф", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    borderRadius: 10,
                    border: Border.all(
                      color: MyColors.borderColor,
                      width: 1.5,
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(TariffDetailScreen(doc: widget.item.tariff));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.item.tariff.name}",
                                style: MyTextStyle.cardItemName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: MyColors.cardIcon,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Түзгөн колдонуучу", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    borderRadius: 10,
                    border: Border.all(
                      color: MyColors.borderColor,
                      width: 1.5,
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(UserDetailScreen(doc: widget.item.userCreated));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.item.userCreated.username}",
                                style: MyTextStyle.cardItemName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: MyColors.cardIcon,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Оңдогон колдонуучу", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    borderRadius: 10,
                    border: Border.all(
                      color: MyColors.borderColor,
                      width: 1.5,
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(UserDetailScreen(doc: widget.item.userUpdated));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.item.userUpdated.username}",
                                style: MyTextStyle.cardItemName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: MyColors.cardIcon,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: MyColors.borderColor),
      actions: [
        Image.asset(
          "assets/images/logo.png",
          width: Get.width / 4.5,
        ),
      ],
      title: Text(
        "${widget.item.name}   ${widget.item.lastName}",
        style: TextStyle(color: MyColors.borderColor),
      ),
    );
  }
}

class ClientRow extends StatelessWidget {
  const ClientRow({
    required this.title,
    this.value,
    this.color = MyColors.myWhite,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "$title",
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "$value",
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: MyColors.borderColor,
        ),
      ],
    );
  }
}
