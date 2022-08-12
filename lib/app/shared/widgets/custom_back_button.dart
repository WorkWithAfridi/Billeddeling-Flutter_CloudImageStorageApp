import 'package:billeddeling/app/data/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({
    Key? key,
    this.buttonColor = black,
  }) : super(key: key);
  Color buttonColor = black;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        FluentIcons.arrow_left_12_regular,
        color: buttonColor,
        size: 15,
      ),
    );
  }
}
