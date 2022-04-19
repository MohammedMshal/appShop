import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/utils/theme.dart';
import 'package:shop_app_api/veiw/widgets/auth_widgets/sign_up_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SignUpWedgets(),
      ),
    );
  }
}
