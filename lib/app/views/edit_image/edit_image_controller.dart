import 'dart:typed_data';

import 'package:billeddeling/app/services/image_services.dart';
import 'package:billeddeling/app/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../home/home_controller.dart';

class EditImageScreenController extends GetxController {
  late Uint8List? image;
  TextEditingController titleTextEditingController = TextEditingController();
  var isUploadButtonLoading = false.obs;
  var selectedDate = "Select Date: ".obs;
  selectDate() async {
    var eventDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(2100),
    );
    if (eventDate != null) {
      selectedDate.value = DateFormat.yMMMd().format(eventDate);
    }
  }

  selectDateAsToday() {
    selectedDate.value = DateFormat.yMMMd().format(DateTime.now());
  }

  onUploadButtonClick() async {
    isUploadButtonLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    if (selectedDate.value != "Select Date: " &&
        titleTextEditingController.text.isNotEmpty &&
        image != null) {
      await ImageServices().uploadImage(
        image!,
        titleTextEditingController.text,
        selectedDate.value,
      );

      final HomeController homeController = Get.find();
      await homeController.updateUserModel();
      Get.back();
      showCustomSnackbar(
          title: "Congratulations",
          message: "Your image is now on Billeddeling!");
    } else {
      showCustomSnackbar(
        title: "Alert",
        message:
            "You need to add a title and a time stamp to the image, in order to upload it!",
        isWarning: true,
      );
    }
    isUploadButtonLoading.value = false;
  }
}
