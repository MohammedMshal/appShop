import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/utils/text_utils.dart';
import 'package:shop_app_api/utils/theme.dart';

class ContainerButtomPage extends StatelessWidget {
  const ContainerButtomPage(
      {required this.text,
      required this.onPressed,
      required this.textbutton,
      Key? key})
      : super(key: key);
  final String text;
  final Function() onPressed;
  final String textbutton;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? mainColor : pinkClr,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            TextUtils(
                text: text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            TextButton(
              onPressed: onPressed,
              child: TextUtils(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: textbutton,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
