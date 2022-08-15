import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/services/image_services.dart';
import 'package:billeddeling/app/views/home/home_controller.dart';
import 'package:billeddeling/app/views/image_viewer/image_viewer_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/dimentions.dart';
import '../../../data/constants/fonts.dart';
import '../../../shared/widgets/custom_snackbar.dart';

class ImageTile extends StatefulWidget {
  const ImageTile({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  State<ImageTile> createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  final HomeController controller = Get.find();

  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => ImageViewer(postModel: widget.postModel),
          );
        },
        child: Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(customBorderRadius),
                  child: Image.network(
                    widget.postModel.url,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: regularTextStyle.copyWith(
                        height: .9,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Published on: ${widget.postModel.date}',
                      style: regularTextStyle.copyWith(
                        height: .9,
                        fontSize: 12,
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ),
              isDownloading
                  ? const SizedBox(
                      width: 110,
                      child: LinearProgressIndicator(
                        color: red,
                      ),
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            bool shared = await ImageServices()
                                .shareImage(widget.postModel);
                            if (!shared) {
                              showCustomSnackbar(
                                title: "Oh snap",
                                message:
                                    "An error occurred while trying to share your image!",
                                isWarning: true,
                              );
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueAccent,
                            ),
                            child: const Icon(
                              Icons.share,
                              size: 15,
                              color: white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              isDownloading = true;
                            });
                            await Future.delayed(const Duration(seconds: 2));
                            bool isDownloaded =
                                await ImageServices().downloadImage(
                              widget.postModel,
                            );
                            if (isDownloaded) {
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
                            setState(() {
                              isDownloading = false;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.amber,
                            ),
                            child: const Icon(
                              Icons.download,
                              size: 15,
                              color: navyBlue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller
                                .onEditImageTileButtonClick(widget.postModel);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: navyBlue,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 15,
                              color: white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller
                                .onDeleteImageTileButtonClick(widget.postModel);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            child: const Icon(
                              Icons.delete,
                              size: 15,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
