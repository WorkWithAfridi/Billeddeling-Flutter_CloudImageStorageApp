import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/fonts.dart';
import 'pages/homeframe_pages.dart';
import 'widgets/homeframe_botton_navbar.dart';

class Homeframe extends StatefulWidget {
  const Homeframe({super.key});

  @override
  State<Homeframe> createState() => _HomeframeState();
}

class _HomeframeState extends State<Homeframe> {
  final HomeController controller = Get.find();
  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Billeddeling",
              style: semiBoldTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Text(
              "Your one stop solution\nfor cloud based image storage.",
              style: regularTextStyle.copyWith(
                height: .9,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.openProfilePopUp,
            icon: const Icon(
              FontAwesomeIcons.ellipsisVertical,
              size: 15,
              color: black,
            ),
          )
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: customPadding,
        child: PageView.builder(
          itemCount: 2,
          controller: controller.homePagePageController,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: pages[index],
            );
          },
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: controller.onPageChange,
        ),
      ),
      bottomNavigationBar: HomeframeBottonNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.selectImageSource,
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
