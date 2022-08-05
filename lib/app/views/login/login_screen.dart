import 'package:billeddeling/app/data/constants/colors.dart';
import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/shared/widgets/app_icon_and_title.dart';
import 'package:billeddeling/app/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../shared/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.find();

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CustomButton(
              title: "Login with Facebook",
              titleColor: Colors.white,
              icon: Icons.facebook,
              iconColor: Colors.white,
              buttonColor: navyBlue,
              iconSize: 30,
              callBackFunction: controller.onLoginWithFacebookButtonClick,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
              title: "Login with Google",
              titleColor: Colors.white,
              icon: FontAwesomeIcons.google,
              iconColor: Colors.white,
              buttonColor: red,
              iconSize: 25,
              callBackFunction: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: controller.onSignupButtonClick,
              child: RichText(
                textAlign: TextAlign.start,
                softWrap: true,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Dont have an account?",
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: " SIGNUP NOW!",
                      style: semiBoldTextStyle.copyWith(
                        fontSize: 12,
                        color: red,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
