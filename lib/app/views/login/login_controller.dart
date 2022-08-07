import 'dart:developer';

import 'package:billeddeling/app/routing/routes.dart';
import 'package:billeddeling/app/services/authentication_services.dart';
import 'package:billeddeling/app/shared/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  var isLoginWithGoogleButtonLoading = false.obs;
  var isLoginWithFacebookButtonLoading = false.obs;
  
  onSignupButtonClick() {
    Get.toNamed(ROUTES.getSignupRoute);
  }

  Future onLoginWithFacebookButtonClick() async {
    isLoginWithFacebookButtonLoading.value = true;
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
    isLoginWithFacebookButtonLoading.value = false;
  }

  Future onLoginWithGoogleButtonClick() async {
    isLoginWithGoogleButtonLoading.value = true;
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
    isLoginWithGoogleButtonLoading.value = false;
  }
}
