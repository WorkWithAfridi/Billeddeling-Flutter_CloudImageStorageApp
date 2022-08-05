import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

class SplashController extends GetxController {
  triggerSplashScreen() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }
}
