import 'package:ansar/get_controller/login_controller.dart';
import 'package:ansar/screens/auth_screen/login_screen.dart';
import 'package:ansar/services/url_services.dart';
import 'package:ansar/utils/color_constants.dart';
import 'package:ansar/widgets/home_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

 final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: buildDrawer(),
      appBar: buildAppBar(),
      body: buildSingleChildScrollView(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: MyContainer(
        color: MyColors.primaryColor,
        children: [
          Image.asset("assets/images/logo.png"),
          ElevatedButton(
            onPressed: () {
              // loginController.getLogin();
              Get.to(LoginScreen());
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyColors.borderColor)),
            child: DotListTitle(
              function: () {
                // loginController.getLogin();
                Get.to(LoginScreen());
              },
              child: FaIcon(FontAwesomeIcons.usersCog, color: MyColors.myWhite),
              text: "Администрация",
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: MyColors.borderColor),
      title: Image.asset(
        "assets/images/logo.png",
        width: Get.width / 4.5,
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyContainer(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
            children: [
              MyText(
                text: "КОММЕРЦИЯЛЫК ЭМЕС\nКЕРЕКТӨӨ КООПЕРАТИВИ",
                color: MyColors.cardIcon,
                size: Get.width / 12,
                height: 1.8,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 40),
              SvgPicture.asset(
                "assets/images/car-banner.svg",
                width: Get.width / 1.2,
              ),
            ],
          ),
          MyContainer(
            padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
            width: Get.width,
            color: Color(0xff3B3333),
            children: [
              MyText(
                text: "Биздин кепилдиктер",
                color: MyColors.borderColor,
                size: Get.width / 12,
                height: 1.5,
              ),
              SizedBox(height: 20),
              MyContainer(
                border: Border.all(color: MyColors.borderColor),
                borderRadius: 40,
                color: Colors.transparent,
                padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
                children: [
                  MyText(
                    text: "Өз үйүңүздө бакубат жашоону камсыз кылуу",
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                  const SizedBox(height: 20),
                  MyText(
                    text: "Биздин өзгөчөлүгүбүз:",
                    color: MyColors.myWhite,
                    size: Get.width / 17,
                  ),
                  const SizedBox(height: 20),
                  DotListTitle(
                    text: "Турак-жайды кардардын атына каттоо.",
                  ),
                  DotListTitle(
                    text: "Турак-жайда жашаганга, ижарага бергенге, каттоого турууга укуктуу.",
                  ),
                  DotListTitle(
                    text:
                        "Каалаган учурда кооперативден баш тартууга, акчасын кайтарып алууга укуктуу.",
                  ),
                ],
              ),
            ],
          ),
          MyContainer(
            padding: EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
            children: [
              MyText(
                color: MyColors.borderColor,
                size: Get.width / 15,
                text: "Финансылык шарттар",
              ),
              const SizedBox(height: 30),
              ProgramCard(
                title: "Программа №1",
                plus: "25+4",
                tex1: "Баштапкы төлөм:",
                tex11: "25% батирдин баасынан",
                tex2: "Кызмат акы:",
                tex22: "4% бир жолу алынуучу\nкызмат акы",
                tex3: "Каржылоо суммасы:",
                tex33: "10 000\$\n50 000\$",
                tex4: "Каржылоо мөөнөтү:",
                tex44: "6 айдан - 7 айга чейин",
              ),
              ProgramCard(
                title: "Программа №2",
                plus: "35+4",
                tex1: "Баштапкы төлөм:",
                tex11: "35% батирдин баасынан",
                tex2: "Кызмат акы:",
                tex22: "4% бир жолу алынуучу\nкызмат акы",
                tex3: "Каржылоо суммасы:",
                tex33: "10 000\$\n60 000\$",
                tex4: "Каржылоо мөөнөтү:",
                tex44: "3 айдан - 4 айга чейин",
                tex5: "Төлөө мөөнөтү:",
                tex55: "10 жылга чейин",
              ),
              ProgramCard(
                title: "Программа №3",
                plus: "50+4",
                tex1: "Баштапкы төлөм:",
                tex11: "50% батирдин баасынан",
                tex2: "Кызмат акы:",
                tex22: "4% бир жолу алынуучу\nкызмат акы",
                tex3: "Каржылоо суммасы:",
                tex33: "10 000\$\n65 000\$",
                tex4: "Каржылоо мөөнөтү:",
                tex44: "35 күндөн - 45 күнгө чейин",
              ),
            ],
          ),
          MyContainer(
            color: MyColors.containerBack,
            padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
            children: [
              MyText(
                color: MyColors.borderColor,
                size: Get.width / 15,
                text: "Автоунаа программасы",
              ),
              const SizedBox(height: 30),
              ProgramCard(
                titleColor: MyColors.myWhite,
                tex1: "Баштапкы төлөм:",
                tex11: "35%-50% автоунаанын\nбаасынан",
                tex2: "Кызмат акы:",
                tex22: "6% автоунаанын баасынан",
                tex3: "Каржылоо суммасы:",
                tex33: "2 000\$\n30 000\$",
                tex4: "Каржылоо мөөнөтү:",
                tex44: "35 күндөн - 45 күнгө чейин 50%\n3 айдан - 4 айга чейин 35%",
                tex5: "Төлөө\nмөөнөтү:",
                tex55: "3 жылга чейин",
              ),
            ],
          ),
          MyContainer(
            padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
            children: [
              MyText(
                color: MyColors.borderColor,
                size: Get.width / 15,
                text: "Талап кылынуучу документтер",
              ),
              SizedBox(height: 30),
              MyContainer(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                border: Border.all(color: MyColors.borderColor, width: 2.0),
                borderRadius: 40,
                children: [
                  DotListTitle(
                    text: "Паспорт (көчүрмөсү)",
                    color: MyColors.primaryColor,
                    dotSize: 10,
                  ),
                  DotListTitle(
                    text: "Калкты тейлөө борборунан маалымкат (ЦОН)",
                    color: MyColors.primaryColor,
                    dotSize: 10,
                  ),
                  DotListTitle(
                    text: "Жашагандыгы тууралуу аныктама",
                    color: MyColors.primaryColor,
                    dotSize: 10,
                  ),
                ],
              ),
            ],
          ),
          MyContainer(
            color: MyColors.containerBack,
            padding: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
            children: [
              MyText(
                color: MyColors.borderColor,
                size: Get.width / 15,
                text: "Дарегибиз",
              ),
              const SizedBox(height: 30),
              DotListTitle(
                function: () {
                  print("##");
                  UrlService.launchURL(
                      "https://www.google.com/maps/place/240+Chokmorov+St,+Bishkek/@42.8689539,74.5844423,20.25z/data=!4m5!3m4!1s0x389ec825a89d5f9b:0x969579ba18dac6c1!8m2!3d42.8689313!4d74.58464?shorturl=1");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.searchLocation,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "Бишкек ш. Чокморов көчөсү 240 Ориентир 'Тюбетейка' рестораны",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchCaller("+996550887171");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.mobileAlt,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0550 887 171\n0708 887 171",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchWhatsApp("+996777887171", "ansar group");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0777 887 171",
              ),
              const SizedBox(height: 30),
              DotListTitle(
                function: () {
                  UrlService.launchURL(
                      "https://www.google.com/maps/place/42+%D0%BA%D3%A9%D1%87%D3%A9%D1%81%D2%AF+%D0%9C%D0%BE%D0%BD%D1%83%D0%B5%D0%B2%D0%B0,+%D0%9E%D1%88/@40.5343916,72.7986325,16z/data=!4m2!3m1!1s0x38bdac025969454d:0x2d98b90d285ac39f");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.searchLocation,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "Ош ш., Ы. Монуев 42А Болжол: А.С.Макаренко мектеби",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchCaller("+996703138148");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.mobileAlt,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0703 138 148\n0773 138 148",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchWhatsApp("+996553138148", "ansar group");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0553 138 148",
              ),
              const SizedBox(height: 30),
              DotListTitle(
                function: () {
                  UrlService.launchURL(
                      "https://www.google.com/maps/place/Murat+Salikhov/@40.0030677,70.5476036,17z/data=!3m1!4b1!4m5!3m4!1s0x38ba736dae005e6f:0x349d9a563cd1aa27!8m2!3d40.0030636!4d70.5497923?shorturl=1");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.searchLocation,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "Баткен ш., М. Салихов 26А Болжол: Медина соода борбору",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchCaller("+996227172171");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.mobileAlt,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0227 172 171\n0507 172 171",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchWhatsApp("+996557172171", "ansar group");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0557 172 171",
              ),
              const SizedBox(height: 30),
              DotListTitle(
                function: () {
                  UrlService.launchURL(
                      "https://www.google.com/maps/place/Gostinitsa+Sayakat,+%D1%81,+%D0%90%D0%BB%D0%B0-%D0%91%D1%83%D0%BA%D0%B0/@41.4053972,71.4878428,18z/data=!4m2!3m1!1s0x38a4ebe3ffffffff:0x1332fe74ad0ecc6c");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.searchLocation,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text:
                    "Ала-Бука р., Кербен/Ала-Бука көчөсү Болжол: Почтальондун бет маңдайы, 'Саякат' мейменканасы",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchCaller("+996701330090");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.mobileAlt,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0701 330 090\n0995 330 090",
              ),
              DotListTitle(
                function: () {
                  UrlService.launchWhatsApp("+996771330090", "ansar group");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "0771 330 090",
              ),
              const SizedBox(height: 30),
              DotListTitle(
                function: () {
                  UrlService.launchURL("https://www.instagram.com/ansar_group_kg/");
                },
                child: Container(
                  width: 40,
                  child: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: MyColors.borderColor,
                    size: Get.width / 15,
                  ),
                ),
                text: "@ansar_group_kg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
