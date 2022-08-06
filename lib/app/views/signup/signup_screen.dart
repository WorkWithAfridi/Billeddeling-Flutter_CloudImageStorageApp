import 'package:billeddeling/app/data/constants/colors.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/shared/widgets/app_icon_and_title.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:billeddeling/app/views/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/constants/dimentions.dart';
import '../../shared/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController controller = Get.find();

  @override
  void dispose() {
    Get.delete<SignupController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Container(
        padding: customPadding,
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppIconAndTitle(),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => CustomButton(
                title: "Signup with Facebook",
                titleColor: Colors.white,
                icon: Icons.facebook,
                iconColor: Colors.white,
                buttonColor: navyBlue,
                iconSize: 30,
                callBackFunction: () {},
                isLoading: controller.isSignupWithFacebookButtonLoading.value,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => CustomButton(
                title: "Signup with Google",
                titleColor: Colors.white,
                icon: FontAwesomeIcons.google,
                iconColor: Colors.white,
                buttonColor: red,
                iconSize: 25,
                callBackFunction: controller.onSignupWithGoogleButtonClick,
                isLoading: controller.isSignupWithGoogleButtonLoading.value,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: controller.onLoginButtonClick,
              child: RichText(
                textAlign: TextAlign.start,
                softWrap: true,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account?",
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: " LOGIN",
                      style: semiBoldTextStyle.copyWith(
                        fontSize: 12,
                        color: navyBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: kToolbarHeight,
            )
          ],
        ),
      ),
    );
  }
}
