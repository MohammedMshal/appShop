import 'package:flutter/material.dart';
import 'package:shop_app_api/veiw/widgets/app_screens_widgets/welcom_screen_widget.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: WelcomeScreenWidget()),
    );
  }
}
