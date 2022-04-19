import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/text_utils.dart';
import '../../../utils/theme.dart';

class WelcomeScreenWidget extends StatelessWidget {
  const WelcomeScreenWidget({Key? key}) : super(key: key);
  _buildImageBackground() {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        image: AssetImage(
          'assets/images/background.png',
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  _buildOpacityBlack() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black26,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildSizedBox(100, 0),
        _buildWelcomeText(),
        _buildSizedBox(2, 0),
        _buildAppShopText(),
        _buildSizedBox(250, 0),
        _buildButtonGetStart(),
        _buildSizedBox(30, 0),
        _buildCreateAccount(),
      ]),
    );
  }

  Widget _buildSizedBox(double hight, double width) {
    return SizedBox(
      height: hight,
      width: width,
    );
  }

  Widget _buildWelcomeText() {
    return Container(
      height: 60,
      width: 190,
      decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Center(
        child: TextUtils(
          text: 'Welcome',
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAppShopText() {
    return Container(
      height: 60,
      width: 190,
      decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextUtils(
            text: 'Shop',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
          _buildSizedBox(0, 7),
          const TextUtils(
            text: 'App ',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonGetStart() {
    return ElevatedButton(
      onPressed: () {
        Get.offNamed(Routes.loginScreen);
      },
      child: const TextUtils(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          text: 'Get Start'),
      style: ElevatedButton.styleFrom(
          primary: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
    );
  }

  Widget _buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextUtils(
            text: "Don't have an account?",
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.signUpScreen);
            },
            child: const TextUtils(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              text: 'SignUp',
              textDecoration: TextDecoration.underline,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImageBackground(),
        _buildOpacityBlack(),
      ],
    );
  }
}
