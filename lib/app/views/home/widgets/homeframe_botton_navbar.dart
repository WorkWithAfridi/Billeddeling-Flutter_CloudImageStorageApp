import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/dimentions.dart';
import '../home_controller.dart';

class HomeframeBottonNavigationBar extends StatelessWidget {
  HomeframeBottonNavigationBar({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: white,
        unselectedItemColor: grey,
        selectedItemColor: red,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: customElevation,
        currentIndex: controller.currentHomePageIndex.value,
        onTap: controller.onPageChange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FluentIcons.home_12_regular,
              size: 18,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_4x4_rounded,
              size: 18,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
