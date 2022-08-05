import 'package:flutter/material.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/dimentions.dart';
import '../../../data/constants/fonts.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
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
                  "https://images.unsplash.com/photo-1445363692815-ebcd599f7621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
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
                    "Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu.",
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
                    'Published on: 12/12/12',
                    style: regularTextStyle.copyWith(
                      height: .9,
                      fontSize: 12,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
            const SizedBox(
              width: 10,
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
