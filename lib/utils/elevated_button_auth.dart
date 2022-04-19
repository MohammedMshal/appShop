import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/utils/text_utils.dart';
import 'package:shop_app_api/utils/theme.dart';

class ElevatedButtonAuth extends StatelessWidget {
  const ElevatedButtonAuth(
      {this.padding,
      this.minimumSize,
      required this.textButton,
      required this.onPressed,
      Key? key})
      : super(key: key);
  final String textButton;
  final Function() onPressed;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    double hightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      child: TextUtils(
        text: textButton,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? mainColor : pinkClr,
        minimumSize: Size(widthScreen / 2, hightScreen / 20),
        padding: padding,
        
      ),
    );
  }
}
