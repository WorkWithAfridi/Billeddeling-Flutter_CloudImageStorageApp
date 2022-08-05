import 'package:flutter/material.dart';

import '../../data/constants/dimentions.dart';
import '../../data/constants/fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.icon,
    required this.iconColor,
    required this.buttonColor,
    required this.iconSize,
    required this.callBackFunction,
  }) : super(key: key);

  late String title;
  late Color titleColor;
  late IconData icon;
  late Color iconColor;
  late Color buttonColor;
  late double iconSize;
  late Function callBackFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBackFunction();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: regularTextStyle.copyWith(
                color: titleColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
