import 'package:billeddeling/app/routing/routes.dart';
import 'package:billeddeling/app/services/authentication_services.dart';
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
    if (await AuthenticationServices().isUserSignedIn()) {
      Get.offNamed(ROUTES.getHomeRoute);
    } else {
      Get.offNamed(ROUTES.getLoginRoute);
    }
  }
}
