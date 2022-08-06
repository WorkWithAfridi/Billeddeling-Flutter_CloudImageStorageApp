import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}

class SearchController extends GetxController {
  var searchQuery = "".obs;
}
