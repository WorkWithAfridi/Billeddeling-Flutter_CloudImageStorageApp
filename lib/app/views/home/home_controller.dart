import 'package:billeddeling/app/data/constants/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  var currentHomePageIndex = 0.obs;
  var homePagePageController = PageController(initialPage: 0);
  onPageChange(int index) {
    currentHomePageIndex.value = index;
    homePagePageController.animateToPage(
      currentHomePageIndex.value,
      duration: const Duration(
        microseconds: 200,
      ),
      curve: appAnimationCurve,
    );
  }
}
