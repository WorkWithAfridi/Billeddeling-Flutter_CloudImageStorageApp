import 'package:billeddeling/app/views/splash_screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/app_icon_and_title.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.find();

  @override
  void dispose() {
    Get.delete<SplashController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.triggerSplashScreen();
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const AppIconAndTitle(),
      ),
    );
  }
}
