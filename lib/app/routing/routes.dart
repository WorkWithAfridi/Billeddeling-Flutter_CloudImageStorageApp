import 'package:billeddeling/app/views/splash_screen/splash_controller.dart';
import 'package:billeddeling/app/views/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class ROUTES {
  static get getSplashRoute => "/splash";
  static List<GetPage> routes = [
    GetPage(
      name: getSplashRoute,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
