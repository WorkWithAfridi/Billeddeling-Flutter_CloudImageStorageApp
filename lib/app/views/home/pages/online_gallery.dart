import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/constants/dimentions.dart';

class OnlineGalleryPage extends StatelessWidget {
  const OnlineGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
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
