import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/utils/theme.dart';

import '../../../utils/const_strings.dart';
import '../../../utils/elevated_button_auth.dart';
import '../../../utils/text_form_filed.dart';

class ForgotPassWordWidgits extends StatelessWidget {
  ForgotPassWordWidgits({Key? key}) : super(key: key);

  final TextEditingController controllerEmail = TextEditingController();

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Get.isDarkMode
              ? const Icon(Icons.close, color: Colors.black)
              : const Icon(
                  Icons.close,
                  color: pinkClr,
                )),
    );
  }

  Widget _buildTopText() {
    return Text(
      'If you Want to recover your account, then please provide your email ID below',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Get.isDarkMode ? Colors.black : Colors.white, fontSize: 16),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'assets/images/forgetpass copy.png',
      height: 300,
    );
  }

  Widget _buildTextFormFiledEmail() {
    return TextFormFiledAuth(
        controller: controllerEmail,
        obscureText: false,
        prefix: Get.isDarkMode
            ? Image.asset('assets/images/email.png')
            : Image.asset(
                'assets/images/email.png',
                color: Colors.pink,
              ),
        validator: (value) {
          if (!RegExp(validationEmail).hasMatch(value)) {
            return 'Enter valid email';
          } else {
            return null;
          }
        },
        hintText: 'Email');
  }

  Widget _buildElevatedButton() {
    return ElevatedButtonAuth(
      textButton: 'Send email',
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildCloseButton(),
        _buildTopText(),
        _buildImage(),
        _buildTextFormFiledEmail(),
        _buildElevatedButton(),
      ],
    );
  }
}
