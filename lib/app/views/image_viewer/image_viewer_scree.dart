import 'package:billeddeling/app/data/constants/colors.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/services/image_services.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:billeddeling/app/shared/widgets/custom_snackbar.dart';
import 'package:billeddeling/app/views/edit_image/edit_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_viewer_controller.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  void initState() {
    setData();
    super.initState();
  }

  setData() {
    controller.postModel = widget.postModel;
  }

  final ImageViewerController controller = Get.put(ImageViewerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: InteractiveViewer(
                  child: Image.network(
                    controller.postModel.url,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: CustomBackButton(
                  buttonColor: white,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width / 2,
                      height: kToolbarHeight,
                      alignment: Alignment.center,
                      child: GetBuilder<ImageViewerController>(
                        init: controller,
                        initState: (_) {},
                        builder: (_) {
                          return Text(
                            controller.postModel.title,
                            style: regularTextStyle.copyWith(
                              color: white,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: DeleteButton(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: DownloadButton(),
                      ),
                      Flexible(
                        flex: 1,
                        child: EditButton(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  DeleteButton({
    Key? key,
  }) : super(key: key);

  final ImageViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          controller.onDeleteButtonClick();
        },
        icon: Icon(
          Icons.delete_forever,
          color: white.withOpacity(.8),
        ),
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  DownloadButton({
    Key? key,
  }) : super(key: key);
  final ImageViewerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool downloaded =
            await ImageServices().downloadImage(controller.postModel);
        if (downloaded) {
          showCustomSnackbar(
            title: "Download",
            message:
                "Your image has been downloaded and savved onto your gallery!",
            isSuccess: true,
          );
        } else {
          showCustomSnackbar(
            title: "Oh snap!",
            message:
                "An error occurred while trying to download your image! :(",
            isSuccess: true,
          );
        }
      },
      child: Container(
        color: Colors.transparent,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.download,
              color: white.withOpacity(.8),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Download",
              style: regularTextStyle.copyWith(
                color: white.withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  EditButton({
    Key? key,
  }) : super(key: key);

  final ImageViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.to(
          () => EditImageScreen(
            isEdit: true,
            postModel: controller.postModel,
          ),
        );
        controller.postModel =
            await ImageServices().getPost(controller.postModel.postId);
        controller.update();
      },
      child: Container(
        color: Colors.transparent,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: white.withOpacity(.8),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Edit",
              style: regularTextStyle.copyWith(
                color: white.withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
