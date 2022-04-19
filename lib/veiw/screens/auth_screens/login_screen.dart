import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/veiw/widgets/auth_widgets/login_widgets.dart';

import '../../../utils/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: LoginWidgets(),
      ),
    );
  }
}
