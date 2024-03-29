import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/fonts.dart';

class AppIconAndTitle extends StatelessWidget {
  const AppIconAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FluentIcons.camera_16_regular,
          size: 40,
          color: black,
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          height: 35,
          width: 0.5,
          color: navyBlue.withOpacity(.5),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Billeddeling",
              style: semiBoldTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              "Cloud Storage for Images.",
              style: regularTextStyle.copyWith(
                height: .7,
                fontSize: 8,
              ),
            ),
          ],
        )
      ],
    );
  }
}
