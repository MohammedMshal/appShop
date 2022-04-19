import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/check_box.dart';
import '../../../utils/const_strings.dart';
import '../../../utils/container_bottom_page.dart';
import '../../../utils/elevated_button_auth.dart';
import '../../../utils/text_form_filed.dart';
import '../../../utils/text_utils.dart';
import '../../../utils/theme.dart';

class LoginWidgets extends StatelessWidget {
  LoginWidgets({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final controllerPassWordGet = Get.find<AuthController>();

  Widget _buildSizedBox(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget _buildLoginText() {
    return Row(
      children: [
        TextUtils(
            text: 'LOG',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? mainColor : pinkClr),
        TextUtils(
            text: ' IN',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? Colors.black : Colors.white),
      ],
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

  Widget _buildTextFormFiledPassword() {
    //قمنا بوضع بإستدعاء الكونترولر فى المكان الذى نريد إستعماله فيه
    return GetBuilder<AuthController>(
      builder: ((_) {
        return TextFormFiledAuth(
            controller: controllerPassword,
            obscureText: controllerPassWordGet.isVisibility ? false : true,
            prefix: Get.isDarkMode
                ? Image.asset('assets/images/lock.png')
                : Image.asset(
                    'assets/images/lock.png',
                    color: Colors.pink,
                  ),
            suffixIcon: IconButton(
              onPressed: () {
                controllerPassWordGet.visibility();
              },
              icon: controllerPassWordGet.isVisibility
                  ? Get.isDarkMode
                      ? const Icon(Icons.visibility_off, color: mainColor)
                      : const Icon(Icons.visibility_off, color: Colors.pink)
                  : Get.isDarkMode
                      ? const Icon(Icons.visibility, color: mainColor)
                      : const Icon(Icons.visibility, color: Colors.pink),
            ),
            validator: (value) {
              if (!RegExp(validationPassword).hasMatch(value)) {
                return 'Enter vaild pssword';
              } else {
                return null;
              }
            },
            hintText: 'Password');
      }),
    );
  }

  Widget _buildTextForgotPassword() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.forgotPasswordScreen);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: TextUtils(
          color: Get.isDarkMode ? Colors.blue : Colors.blue,
          fontSize: 18,
          text: 'Forgot your password ?',
        ),
      ),
    );
  }

  Widget _buildCheckBox() {
    return BuildCheckBox(
      onPressed: () {
        Get.toNamed(Routes.forgotPasswordScreen);
      },
      text: '  Remember me ',
      textButton: '',
    );
  }

  Widget _buildElevatedButton() {
    return ElevatedButtonAuth(textButton: 'LOGIN', onPressed: () {});
  }

  Widget _buildContainerButtomPage() {
    return ContainerButtomPage(
      onPressed: () {
        Get.toNamed(Routes.signUpScreen);
      },
      text: "Do not have an account?",
      textbutton: 'SignUp',
    );
  }

  Widget _buildTextOR() {
    return TextUtils(
      text: 'OR',
      fontSize: 18,
      color: Get.isDarkMode ? Colors.black : Colors.white,
    );
  }

  Widget _buildImageAuth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {}, icon: Image.asset('assets/images/google.png')),
        IconButton(
            onPressed: () {}, icon: Image.asset('assets/images/facebook.png')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          width: widthScreen,
          height: heightScreen - 120,
          padding: EdgeInsets.only(top: heightScreen / 10, right: 10, left: 10),
          child: Column(
            children: [
              _buildLoginText(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    _buildSizedBox(20, 0),
                    _buildTextFormFiledEmail(),
                    _buildSizedBox(20, 0),
                    _buildTextFormFiledPassword(),
                    _buildTextForgotPassword(),
                  ],
                ),
              ),
              _buildSizedBox(20, 0),
              _buildCheckBox(),
              _buildElevatedButton(),
              _buildSizedBox(20, 0),
              _buildTextOR(),
              _buildSizedBox(20, 0),
              _buildImageAuth(),
            ],
          ),
        ),
        _buildContainerButtomPage(),
      ],
    );
  }
}
