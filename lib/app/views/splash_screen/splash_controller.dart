import 'package:billeddeling/app/routing/routes.dart';
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
    Get.offNamed(ROUTES.getLoginRoute);
  }
}
