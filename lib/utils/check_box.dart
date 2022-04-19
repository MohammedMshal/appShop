import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/utils/text_utils.dart';

import '../logic/controllers/auth_controller.dart';

class BuildCheckBox extends StatelessWidget {
  BuildCheckBox(
      {required this.text,
      required this.onPressed,
      required this.textButton,
      Key? key})
      : super(key: key);
  final controllerCheckBoxGet = Get.find<AuthController>();
  final String text;
  final Function() onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controllerCheckBoxGet.checkBox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controllerCheckBoxGet.isCheckBox
                    ? Get.isDarkMode
                        ? Image.asset('assets/images/check.png')
                        : Image.asset('assets/images/check.png',
                            color: Colors.pink)
                    : Container()),
          ),
          TextUtils(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.black : Colors.white),
          InkWell(
            onTap: onPressed,
            child: TextUtils(
                text: textButton,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                textDecoration: TextDecoration.underline,
                color: Get.isDarkMode ? Colors.black : Colors.white),
          )
        ],
      );
    });
  }
}
