import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/views/image_viewer/image_viewer_scree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/dimentions.dart';
import '../../../data/constants/fonts.dart';
import '../home_controller.dart';

class OnlineGalleryPage extends StatelessWidget {
  OnlineGalleryPage({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "• Gallery",
          style: semiBoldTextStyle.copyWith(
            fontSize: 14,
            color: black,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        GetBuilder<HomeController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return controller.user.imageList!.length.toString() == "0"
                ? Text(
                    "You do not have any images shared on Billeddeling.Upload and share images to view them here!",
                    style: regularTextStyle.copyWith(
                      color: grey,
                      height: .9,
                    ),
                    textAlign: TextAlign.start,
                  )
                : StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        // .where(
                        //   "userId",
                        //   isEqualTo: FirebaseServices().getCurrentUserId(),
                        // )
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            const QuiltedGridTile(2, 2),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 2),
                          ],
                        ),
                        itemBuilder: (context, index) {
                          PostModel postModel = PostModel.fromJson(snapshot.data!.docs[index]);
                          return GestureDetector(
                            onTap: () {
                              Get.to(ImageViewer(postModel: postModel));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(customBorderRadius),
                              child: Image.network(
                                postModel.url,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
          },
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
