import 'package:ansar/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({
    this.title,
    this.plus,
    required this.tex1,
    required this.tex11,
    required this.tex2,
    required this.tex22,
    required this.tex3,
    required this.tex33,
    required this.tex4,
    required this.tex44,
    this.titleColor = Colors.black,
    this.color = Colors.transparent,
    this.tex5,
    this.tex55,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? plus;
  final String tex1;
  final String tex11;
  final String tex2;
  final String tex22;
  final String tex3;
  final String tex33;
  final String tex4;
  final String tex44;
  final String? tex5;
  final String? tex55;
  final Color color;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: color,
      width: Get.width,
      border: Border.all(
        color: MyColors.borderColor,
        width: 2.0,
      ),
      borderRadius: 40,
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      children: [
        title != null
            ? MyText(
                text: title!,
                color: titleColor,
                size: Get.width / 17,
              )
            : Container(),
        const SizedBox(height: 30),
        plus != null
            ? MyText(
                text: plus!,
                color: MyColors.borderColor,
                size: Get.width / 8,
              )
            : Container(),
        const SizedBox(height: 25),
        MyText(
          text: tex1,
          color: titleColor,
          size: Get.width / 20,
        ),
        MyText(
          text: tex11,
          color: MyColors.borderColor,
          size: Get.width / 20,
        ),
        const SizedBox(height: 15),
        MyText(
          text: tex2,
          color: titleColor,
          size: Get.width / 20,
        ),
        MyText(
          text: tex22,
          color: MyColors.borderColor,
          size: Get.width / 20,
        ),
        const SizedBox(height: 15),
        MyText(
          text: tex3,
          color: titleColor,
          size: Get.width / 20,
        ),
        MyText(
          text: tex33,
          color: MyColors.borderColor,
          size: Get.width / 20,
        ),
        const SizedBox(height: 15),
        MyText(
          text: tex4,
          color: titleColor,
          size: Get.width / 20,
        ),
        MyText(
          text: tex44,
          color: MyColors.borderColor,
          size: Get.width / 20,
        ),
        const SizedBox(height: 15),
        if (tex5 != null)
          MyText(
            text: tex5!,
            color: titleColor,
            size: Get.width / 20,
          )
        else
          Container(),
        if (tex55 != null)
          MyText(
            text: tex55!,
            color: Color(0xffE0A20F),
            size: Get.width / 20,
          )
        else
          Container(),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    required this.children,
    this.padding,
    this.margin,
    this.color = MyColors.myWhite,
    this.borderRadius = 0,
    this.width = double.infinity,
    this.border,
    Key? key,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  final Color color;
  final double borderRadius;
  final double width;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    required this.text,
    this.color = MyColors.borderColor,
    this.height = 1.3,
    this.size = 18,
    this.textAlign = TextAlign.center,
    Key? key,
  }) : super(key: key);

  final String text;
  final double size;
  final Color color;
  final double height;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DotListTitle extends StatelessWidget {
  const DotListTitle({
    required this.text,
    this.color = MyColors.myWhite,
    this.dotSize = 20,
    this.child,
    this.function,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final double dotSize;
  final Widget? child;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding:const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (function != null) {
            function!();
          } else {}
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child == null
                ? Icon(
                    Icons.circle,
                    color: color,
                    size: dotSize,
                  )
                : child!,
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                maxLines: 10,
                style: TextStyle(
                  fontSize: Get.width / 25,
                  height: 1.3,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
