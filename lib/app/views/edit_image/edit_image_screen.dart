import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:billeddeling/app/shared/widgets/custom_button.dart';
import 'package:billeddeling/app/views/edit_image/edit_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';

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
              Container(
                height: 300,
                color: navyBlue,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                isData: true,
              ),
              const SizedBox(
                height: 15,
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

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.isData = false,
  }) : super(key: key);

  bool isData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: regularTextStyle,
      cursorColor: red,
      maxLines: 1,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Enter title for the image...",
        hintStyle: regularTextStyle,
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            Get.context,
            color: grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            Get.context,
            color: red,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            Get.context,
            color: navyBlue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        fillColor: navyBlue.withOpacity(.1),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        suffix: isData
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: navyBlue,
                  borderRadius: BorderRadius.circular(customBorderRadius),
                ),
                child: Text(
                  "TODAY",
                  style: mediumTextStyle.copyWith(
                    color: white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
