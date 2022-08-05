import 'package:billeddeling/app/views/edit_image/edit_image_screen.dart';
import 'package:billeddeling/app/views/home/home_controller.dart';
import 'package:billeddeling/app/views/home/homeframe.dart';
import 'package:billeddeling/app/views/login/login_controller.dart';
import 'package:billeddeling/app/views/login/login_screen.dart';
import 'package:billeddeling/app/views/search_screen/search_controller.dart';
import 'package:billeddeling/app/views/search_screen/search_screen.dart';
import 'package:billeddeling/app/views/signup/signup_controller.dart';
import 'package:billeddeling/app/views/signup/signup_screen.dart';
import 'package:billeddeling/app/views/splash_screen/splash_controller.dart';
import 'package:billeddeling/app/views/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class ROUTES {
  static get getSplashRoute => "/splash";
  static get getLoginRoute => "/login";
  static get getSignupRoute => "/login/signin";
  static get getHomeRoute => "/home";
  static get getEditImageScreenRoute => "/home/edit_image";
  static get getSearchScreenRoute => "/home/search";
  static List<GetPage> routes = [
    GetPage(
      name: getSplashRoute,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: getLoginRoute,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: getSignupRoute,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: getHomeRoute,
      page: () => const Homeframe(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: getEditImageScreenRoute,
      page: () => const EditImageScreen(),
    ),
    GetPage(
      name: getSearchScreenRoute,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    )
  ];
}
