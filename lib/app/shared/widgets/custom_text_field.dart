import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/dimentions.dart';
import '../../data/constants/fonts.dart';

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
        fillColor: navyBlue.withOpacity(.05),
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
