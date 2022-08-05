import 'package:get/get.dart';

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
}
