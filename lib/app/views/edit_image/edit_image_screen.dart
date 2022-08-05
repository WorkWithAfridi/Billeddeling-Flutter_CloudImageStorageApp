import 'dart:typed_data';

import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:billeddeling/app/views/edit_image/edit_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';

class EditImageScreen extends StatefulWidget {
  Uint8List image;
  EditImageScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  late final EditImageScreenController controller;
  @override
  void initState() {
    controller = Get.put(EditImageScreenController());
    controller.image = widget.image;
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
              SizedBox(
                height: 300,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(customBorderRadius),
                        child: Image.memory(
                          controller.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(customBorderRadius),
                          color: navyBlue.withOpacity(.7),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Remove Image",
                          style: mediumTextStyle.copyWith(
                            color: white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "• Add a title",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 14,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                title: "Enter a title for the image...",
                textEditingController: controller.titleTextEditingController,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "• Add a date",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 14,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Obx(
                          () => CustomTextField(
                            textEditingController:
                                controller.dateTextEditingController,
                            title: controller.selectedDate.value,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            width: double.maxFinite,
                            color: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: controller.selectDate,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: navyBlue,
                        borderRadius: BorderRadius.circular(customBorderRadius),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "SELECT",
                        style: mediumTextStyle.copyWith(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: controller.selectDateAsToday,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: navyBlue,
                        borderRadius: BorderRadius.circular(customBorderRadius),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "TODAY",
                        style: mediumTextStyle.copyWith(
                          color: white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => CustomButton(
                  title: "Upload Image",
                  titleColor: white,
                  icon: Icons.upload,
                  iconColor: white,
                  buttonColor: red,
                  iconSize: 18,
                  callBackFunction: controller.onUploadButtonClick,
                  isLoading: controller.isUploadButtonLoading.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
