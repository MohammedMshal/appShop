import 'package:get/get.dart';

//إستخدمنا الجتكس كونترولر فى التبديل بين حالات زار الباسورد
class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }
}
