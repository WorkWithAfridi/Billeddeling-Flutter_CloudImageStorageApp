import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/views/home/home_controller.dart';
import 'package:billeddeling/app/views/image_viewer/image_viewer_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/dimentions.dart';
import '../../../data/constants/fonts.dart';

class ImageTile extends StatelessWidget {
  ImageTile({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => ImageViewer(postModel: postModel),
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
                    postModel.url,
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
                      postModel.title,
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
                      'Published on: ${postModel.date}',
                      style: regularTextStyle.copyWith(
                        height: .9,
                        fontSize: 12,
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.onEditImageTileButtonClick(postModel);
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
                  controller.onDeleteImageTileButtonClick(postModel);
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
          ),
        ),
      ),
    );
  }
}
