import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/fonts.dart';

class Homeframe extends StatefulWidget {
  const Homeframe({Key? key}) : super(key: key);

  @override
  State<Homeframe> createState() => _HomeframeState();
}

class _HomeframeState extends State<Homeframe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Billeddeling",
          style: semiBoldTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
      ),
    );
  }
}
