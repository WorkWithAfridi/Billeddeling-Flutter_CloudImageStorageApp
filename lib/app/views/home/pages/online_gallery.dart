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
        controller.user.imageList!.length.toString() == "0"
            ? Text(
                "You do not have any images shared on Billeddeling.Upload and share images to view them here!",
                style: regularTextStyle.copyWith(
                  color: grey,
                  height: .9,
                ),
                textAlign: TextAlign.start,
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 50,
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
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(customBorderRadius),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1445363692815-ebcd599f7621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
        const SizedBox(
          height: 35,
        ),
      ],
    );

    // GridView.custom(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   gridDelegate: SliverQuiltedGridDelegate(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 4,
    //     repeatPattern: QuiltedGridRepeatPattern.inverted,
    //     pattern: [
    //       const QuiltedGridTile(2, 2),
    //       const QuiltedGridTile(1, 1),
    //       const QuiltedGridTile(1, 1),
    //       const QuiltedGridTile(1, 2),
    //     ],
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) => Image.network(
    //       "https://images.unsplash.com/photo-1445363692815-ebcd599f7621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    // );
  }
}
