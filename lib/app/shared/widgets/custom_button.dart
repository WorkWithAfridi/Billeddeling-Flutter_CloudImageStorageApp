import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    required this.isLoading,
  }) : super(key: key);

  late String title;
  late Color titleColor;
  late IconData icon;
  late Color iconColor;
  late Color buttonColor;
  late double iconSize;
  late Function callBackFunction;
  late bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBackFunction();
      },
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        child: isLoading
            ? LottieBuilder.asset(
                "assets/lottie_animations/loading-animation.json")
            : Row(
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
