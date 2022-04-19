import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/utils/text_utils.dart';
import 'package:shop_app_api/utils/theme.dart';
import 'package:shop_app_api/veiw/widgets/auth_widgets/forgot_password_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
        shape: RoundedRectangleBorder(
            side: Get.isDarkMode
                ? const BorderSide(color: mainColor)
                : const BorderSide(color: pinkClr)),
        title: TextUtils(
          color: Get.isDarkMode ? Colors.white : pinkClr,
          fontSize: 18,
          text: 'Forgot Password',
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Get.isDarkMode
                ? const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.arrow_back,
                    color: pinkClr,
                  )),
      ),
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      body: Form(
        key: formkey,
        child:  ForgotPassWordWidgits(),
      ),
    ));
  }
}
