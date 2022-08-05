import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:billeddeling/app/shared/widgets/custom_button.dart';
import 'package:billeddeling/app/views/edit_image/edit_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';
import '../../shared/widgets/custom_text_field.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({Key? key}) : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  late final EditImageScreenController controller;
  @override
  void initState() {
    controller = Get.put(EditImageScreenController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<EditImageScreenController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit details",
          style: semiBoldTextStyle,
        ),
        leading: const CustomBackButton(),
      ),
      body: Container(
        padding: customPadding,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• Selected image",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 14,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 300,
                color: navyBlue,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "• Edit/ Add details",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 14,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                isData: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                title: "Upload",
                titleColor: white,
                icon: Icons.upload,
                iconColor: white,
                buttonColor: navyBlue,
                iconSize: 18,
                callBackFunction: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
