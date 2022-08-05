import 'package:billeddeling/app/routing/routes.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  onSignupButtonClick() {
    Get.toNamed(ROUTES.getSignupRoute);
  }

  onLoginWithFacebookButtonClick() {
    Get.offAllNamed(ROUTES.getHomeRoute);
  }
}
