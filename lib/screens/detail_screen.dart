import 'package:ansar/get_controller/client_controller.dart';
import 'package:ansar/models/client_model.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          setState(() {
          });
        },
        child: SingleChildScrollView(
          child: MyContainer(
            padding: const EdgeInsets.all(20),
            color: MyColors.containerBack,
            children: [
              MyContainer(
                color: Colors.transparent,
                children: [
                  ClientRow(title: "Аты :", value: widget.item.name),
                  ClientRow(title: "Ф.О.И :", value: widget.item.lastName),
                  ClientRow(title: "Акчасы :", value: "${widget.item.totalMoney}"),
                  ClientRow(title: "contract_at:", value: widget.item.contractAt),
                  ClientRow(title: "created_at", value: widget.item.createdAt),
                  ClientRow(title: "updated_at", value: widget.item.updatedAt),
                  ClientRow(title: "status:", value: widget.item.status),
                  ClientRow(title: "end_at:", value: widget.item.endAt),
                  ClientRow(title: "first_payments", value: "${widget.item.firstPaymentsEndAt}"),
                ],
              ),
              const SizedBox(height: 20),
              widget.item.documents != []
                  ? MyContainer(
                      color: Colors.transparent,
                      children: [
                        MyText(text: "Документы", size: Get.width / 15),
                        const SizedBox(height: 10),
                        MyContainer(
                          borderRadius: 10,
                          padding: const EdgeInsets.all(10),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: widget.item.documents.length,
                              itemBuilder: (context, index) {
                                final dynamic doc = widget.item.documents;
                                return Column(
                                  children: [
                                    ClientRow(
                                      title: "ID",
                                      value: "${widget.item.documents[index].id}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "Аталышы",
                                      value: "${widget.item.documents[index].name}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "documents",
                                      value: "${widget.item.documents[index].documents}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "created_at",
                                      value: "${widget.item.documents[index].createdAt}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "updated_at",
                                      value: "${widget.item.documents[index].updatedAt}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "client:",
                                      value: "${widget.item.documents[index].client}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "user_created",
                                      value: "${widget.item.documents[index].userCreated.username}",
                                      color: MyColors.primaryColor,
                                    ),
                                    ClientRow(
                                      title: "user_updated",
                                      value: "${widget.item.documents[index].userUpdated.username}",
                                      color: MyColors.primaryColor,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 10,
                                      color: MyColors.containerBack,
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(height: 30),
              widget.item.notesSet != []
                  ? MyContainer(
                      color: Colors.transparent,
                      children: [
                        MyText(text: "Эстөөлөр", size: Get.width / 15),
                        const SizedBox(height: 10),
                        MyContainer(
                          borderRadius: 10,
                          padding: const EdgeInsets.all(10),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: widget.item.notesSet.length,
                              itemBuilder: (context, index) {
                                final dynamic doc = widget.item.notesSet;
                                return Column(
                                  children: [
                                    ClientRow(
                                      title: "ID",
                                      value: "${widget.item.notesSet[index].id}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "Текст",
                                      value: "${widget.item.notesSet[index].message}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "created_at",
                                      value: "${widget.item.notesSet[index].createdAt}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "updated_at",
                                      value: "${widget.item.notesSet[index].updatedAt}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "client:",
                                      value: "${widget.item.notesSet[index].client}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "user_created",
                                      value: "${widget.item.notesSet[index].userCreated.username}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "user_updated",
                                      value: "${widget.item.notesSet[index].userUpdated.username}",
                                      color: MyColors.containerBack,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 10,
                                      color: MyColors.containerBack,
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(height: 30),
              widget.item.payments != []
                  ? MyContainer(
                      color: Colors.transparent,
                      children: [
                        MyText(text: "Төлөмдөр", size: Get.width / 15),
                        const SizedBox(height: 10),
                        MyContainer(
                          borderRadius: 10,
                          padding: const EdgeInsets.all(10),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: widget.item.payments.length,
                              itemBuilder: (context, index) {
                                final dynamic doc = widget.item.payments;
                                return Column(
                                  children: [
                                    ClientRow(
                                      title: "ID",
                                      value: "${widget.item.payments[index].id}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "Аталышы",
                                      value: "${widget.item.payments[index].name}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "created_at",
                                      value: "${widget.item.payments[index].createdAt}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "updated_at",
                                      value: "${widget.item.payments[index].updatedAt}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "client:",
                                      value: "${widget.item.payments[index].client}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "user_created",
                                      value: "${widget.item.payments[index].userCreated.username}",
                                      color: MyColors.containerBack,
                                    ),
                                    ClientRow(
                                      title: "user_updated",
                                      value: "${widget.item.payments[index].userUpdated.username}",
                                      color: MyColors.containerBack,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 10,
                                      color: MyColors.containerBack,
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
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
                    borderRadius: 10,
                    padding: const EdgeInsets.all(10),
                    children: [
                      ClientRow(
                        title: "ID",
                        value: "${widget.item.city.id}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "Аталышы",
                        value: "${widget.item.city.name}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "user_created_at",
                        value: "${widget.item.city.userCreated.username}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "user_updated_at",
                        value: "${widget.item.city.userUpdated.username}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "createdAt:",
                        value: "${widget.item.city.createdAt}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "updatedAt",
                        value: "${widget.item.city.updatedAt}",
                        color: MyColors.containerBack,
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: MyColors.containerBack,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Тариф", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    borderRadius: 10,
                    padding: const EdgeInsets.all(10),
                    children: [
                      ClientRow(
                        title: "ID",
                        value: "${widget.item.tariff.id}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "Аталышы",
                        value: "${widget.item.tariff.name}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "user_created_at",
                        value: "${widget.item.tariff.userCreated.username}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "user_updated_at",
                        value: "${widget.item.tariff.userUpdated.username}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "createdAt:",
                        value: "${widget.item.tariff.createdAt}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "updatedAt",
                        value: "${widget.item.tariff.updatedAt}",
                        color: MyColors.containerBack,
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: MyColors.containerBack,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Түзгөн колдонуучу", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    borderRadius: 10,
                    padding: const EdgeInsets.all(10),
                    children: [
                      ClientRow(
                        title: "Колдоннучу аты",
                        value: "${widget.item.userCreated.username}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "Аты",
                        value: "${widget.item.userCreated.firstName}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "Ф.О.И",
                        value: "${widget.item.userCreated.lastName}",
                        color: MyColors.containerBack,
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: MyColors.containerBack,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              MyContainer(
                color: Colors.transparent,
                children: [
                  MyText(text: "Оңдогон колдонуучу", size: Get.width / 15),
                  const SizedBox(height: 10),
                  MyContainer(
                    borderRadius: 10,
                    padding: const EdgeInsets.all(10),
                    children: [
                      ClientRow(
                        title: "Колдоннучу аты",
                        value: "${widget.item.userUpdated.username}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "Аты",
                        value: "${widget.item.userUpdated.firstName}",
                        color: MyColors.containerBack,
                      ),
                      ClientRow(
                        title: "Ф.О.И",
                        value: "${widget.item.userUpdated.lastName}",
                        color: MyColors.containerBack,
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: MyColors.containerBack,
                      )
                    ],
                  )
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
