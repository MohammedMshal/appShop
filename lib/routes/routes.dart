import 'package:get/get.dart';
import 'package:shop_app_api/logic/bindings/auth_binding.dart';
import 'package:shop_app_api/veiw/screens/auth_screens/forgot_password_screen.dart';

import '../veiw/screens/app_screens/welcome_screen.dart';
import '../veiw/screens/auth_screens/login_screen.dart';
import '../veiw/screens/auth_screens/signup_screen.dart';

class AppRout {
  //initailRout
  static const welcomeScreenRoute = Routes.welcomeScreen;
  //get pages
  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => const SignUpScreen(),
        //قمنا بوضع الكونترولرهنا الذى أنشأنه
        binding: AuthBinding()),
    GetPage(
        name: Routes.loginScreen,
        page: () => const LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding())
  ];
}

class Routes {
  static const welcomeScreen = '/';
  static const loginScreen = '/loginscreen';
  static const signUpScreen = '/signupscreen';
  static const forgotPasswordScreen = '/forgotpasswordscreen';
}
