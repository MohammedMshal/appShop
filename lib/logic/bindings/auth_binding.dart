import 'package:get/get.dart';
import 'package:shop_app_api/logic/controllers/auth_controller.dart';
//قمنا بوضع الكونترولر الذى أنشأنه هنا لوضعه داخل أى صفحة نحتاجها
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

