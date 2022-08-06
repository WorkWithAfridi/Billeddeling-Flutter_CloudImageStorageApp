import 'dart:developer';

import 'package:get/get.dart';

import '../../routing/routes.dart';
import '../../services/authentication_services.dart';
import '../../shared/widgets/custom_snackbar.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}

class SignupController extends GetxController {
  onLoginButtonClick() {
    Get.back();
  }

  var isSignupWithGoogleButtonLoading = false.obs;
  var isSignupWithFacebookButtonLoading = false.obs;

  Future onSignupWithGoogleButtonClick() async {
    isSignupWithGoogleButtonLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (await AuthenticationServices().signinWithGoogle()) {
        Get.toNamed(ROUTES.getHomeRoute);
      } else {
        showCustomSnackbar(
          title: "Error",
          message: "An error occurred while trying to log you in!",
          isError: true,
        );
      }
    } catch (err) {
      log(err.toString());
    }
    isSignupWithGoogleButtonLoading.value = false;
  }

  Future onSignupWithFacebookButtonClick() async {
    isSignupWithFacebookButtonLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (await AuthenticationServices().signinWithFacebook()) {
        Get.toNamed(ROUTES.getHomeRoute);
      } else {
        showCustomSnackbar(
          title: "Error",
          message: "An error occurred while trying to log you in!",
          isError: true,
        );
      }
    } catch (err) {
      log(err.toString());
    }
    isSignupWithFacebookButtonLoading.value = false;
  }
}
