import 'package:billeddeling/app/data/constants/colors.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FluentIcons.camera_16_regular,
              size: 40,
              color: red,
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 35,
              width: 0.5,
              color: navyBlue.withOpacity(.5),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Billeddeling",
                  style: semiBoldTextStyle,
                ),
                Text(
                  "Image Sharing App",
                  style: regularTextStyle.copyWith(
                    height: .7,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
