import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';

showCustomSnackbar({
  required String title,
  required String message,
  bool isError = false,
  bool isSuccess = false,
  bool isWarning = false,
}) {
  Get.snackbar(
    "_",
    "_",
    borderRadius: customBorderRadius,
    shouldIconPulse: true,
    boxShadows: [
      BoxShadow(
        offset: const Offset(0, 2),
        color: Colors.black.withOpacity(.1),
        blurRadius: 10,
        spreadRadius: 10,
      )
    ],
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError
        ? red
        : isSuccess
            ? Colors.green
            : isWarning
                ? Colors.orange
                : navyBlue,
    margin: const EdgeInsets.all(20),
    duration: const Duration(seconds: 6),
    titleText: Text(
      title,
      style: boldTextStyle.copyWith(
        fontSize: 18,
        color: Colors.white,
        height: .95,
      ),
    ),
    borderWidth: 20,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    icon: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/snackbar_assets/chat_bubble.svg',
            color: isError
                ? const Color(0xFF801336)
                : isSuccess
                    ? Colors.greenAccent
                    : isWarning
                        ? Colors.orangeAccent
                        : Colors.blueAccent,
            height: 40,
          ),
          Positioned(
            top: 10,
            child: SvgPicture.asset(
              isError
                  ? 'assets/snackbar_assets/close.svg'
                  : isSuccess
                      ? 'assets/snackbar_assets/success.svg'
                      : isWarning
                          ? 'assets/snackbar_assets/warning.svg'
                          : 'assets/snackbar_assets/notification.svg',
              height: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    messageText: Text(
      message,
      style: regularTextStyle.copyWith(
        fontSize: 12,
        color: Colors.white,
        height: 1,
      ),
    ),
  );
}
