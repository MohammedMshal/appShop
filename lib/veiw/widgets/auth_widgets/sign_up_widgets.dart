import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/logic/controllers/auth_controller.dart';
import 'package:shop_app_api/routes/routes.dart';
import 'package:shop_app_api/utils/check_box.dart';
import 'package:shop_app_api/utils/const_strings.dart';
import 'package:shop_app_api/utils/container_bottom_page.dart';
import 'package:shop_app_api/utils/elevated_button_auth.dart';
import 'package:shop_app_api/utils/text_form_filed.dart';

import '../../../utils/text_utils.dart';
import '../../../utils/theme.dart';

class SignUpWedgets extends StatelessWidget {
  SignUpWedgets({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  //قمنا بإستدعائها بطريقة أخرى
  final controllerPassWordGet = Get.find<AuthController>();
  //مثال لإستدعاء الكونترولر الذى أنشأنه لإستعمالة بشكل مباشر  فى الصفحة
  //final ControllerPassword = Get.put(AuthController());

  Widget _buildSizedBox(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget _buildSignUpText() {
    return Row(
      children: [
        TextUtils(
            text: 'SIGN',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? mainColor : pinkClr),
        TextUtils(
            text: ' UP',
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? Colors.black : Colors.white),
      ],
    );
  }

  Widget _buildTextFormFiledUserName() {
    return TextFormFiledAuth(
      controller: controllerUserName,
      obscureText: false,
      prefix: Get.isDarkMode
          ? Image.asset('assets/images/user.png')
          : Image.asset(
              'assets/images/user.png',
              color: Colors.pink,
            ),
      validator: (value) {
        if (value.toString().length <= 1 ||
            !RegExp(validationName).hasMatch(value)) {
          return 'Enter valid Name';
        } else {
          return null;
        }
      },
      hintText: 'User Name',
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

  Widget _buildCheckBox() {
    return BuildCheckBox(
      onPressed: () {
        Get.toNamed(Routes.forgotPasswordScreen);
      },
      text: '  i accepte ',
      textButton: ' terms & conditions',
    );
  }

  Widget _buildElevatedButton() {
    return ElevatedButtonAuth(textButton: 'SIGN UP', onPressed: () {});
  }

  Widget _buildContainerButtomPage() {
    return ContainerButtomPage(
      onPressed: () {
        Get.toNamed(Routes.loginScreen);
      },
      text: 'Already have an Account?',
      textbutton: 'Login',
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
              _buildSignUpText(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    _buildTextFormFiledUserName(),
                    _buildSizedBox(20, 0),
                    _buildTextFormFiledEmail(),
                    _buildSizedBox(20, 0),
                    _buildTextFormFiledPassword(),
                  ],
                ),
              ),
              _buildSizedBox(20, 0),
              _buildCheckBox(),
              _buildElevatedButton(),
            ],
          ),
        ),
        _buildContainerButtomPage(),
      ],
    );
  }
}
