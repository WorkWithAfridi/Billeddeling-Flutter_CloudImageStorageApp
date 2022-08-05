import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';
import '../../shared/widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: boldTextStyle,
        ),
        leading: const CustomBackButton(),
      ),
      body: Container(
        padding: customPadding,
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(),
                ),
                const SizedBox(
                  width: 6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: navyBlue,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Search results",
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 14,
                      color: black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
