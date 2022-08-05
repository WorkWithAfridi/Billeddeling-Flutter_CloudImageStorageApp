import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/app_icon_and_title.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const AppIconAndTitle(),
      ),
    );
  }
}
