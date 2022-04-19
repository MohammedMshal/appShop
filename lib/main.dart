import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_api/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //قمنا بإستدعاء الجيت لإستعمالها
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRout.welcomeScreenRoute,
      //قمنا بإضافة الصفحات الى الجيت
      getPages: AppRout.routes,
    );
  }
}
