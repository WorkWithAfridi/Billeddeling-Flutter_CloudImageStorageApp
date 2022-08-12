import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:get/get.dart';

import '../../services/image_services.dart';
import '../../shared/widgets/custom_snackbar.dart';
import '../home/home_controller.dart';

class ImageViewerController extends GetxController {
  late PostModel postModel;
  Future onDeleteButtonClick() async {
    await ImageServices().deletePost(postModel);
    await Get.find<HomeController>().updateUserModel();
    Get.back();
    showCustomSnackbar(
      title: "Success",
      message: "Post Deleted!",
      isSuccess: true,
    );
  }
}
