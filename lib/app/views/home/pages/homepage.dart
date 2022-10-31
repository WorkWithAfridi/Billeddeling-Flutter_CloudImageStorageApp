import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/views/home/home_controller.dart';
import 'package:billeddeling/app/views/home/widgets/image_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/fonts.dart';
import '../../../services/firebase_services.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        IntroductionModule(),
        const SizedBox(
          height: 10,
        ),
        AccountStatusModule(),
        const SizedBox(
          height: 5,
        ),
        ImageBrowserModule(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class IntroductionModule extends StatelessWidget {
  IntroductionModule({
    Key? key,
  }) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: controller.openProfilePopUp,
          child: CircleAvatar(
            backgroundColor: navyBlue,
            radius: 25,
            child: CircleAvatar(
              radius: 23,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Image.network(
                  controller.user.profilePicUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Hi, ",
                      style: regularTextStyle,
                    ),
                    TextSpan(
                      text: controller.user.name,
                      style: semiBoldTextStyle.copyWith(color: red),
                    )
                  ],
                ),
              ),
              Text(
                "Welcome Back!!",
                style: semiBoldTextStyle.copyWith(
                  color: black.withOpacity(.8),
                  height: .95,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: controller.onSearchButtonClick,
          child: CircleAvatar(
            backgroundColor: red.withOpacity(.1),
            radius: 20,
            child: const Icon(
              Icons.search,
              color: navyBlue,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageBrowserModule extends StatelessWidget {
  ImageBrowserModule({
    Key? key,
  }) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• Images",
          style: semiBoldTextStyle.copyWith(
            fontSize: 14,
            color: black,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        GetBuilder<HomeController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return controller.user.imageList!.length.toString() == "0"
                ? Text(
                    "You do not have any images shared on Billeddeling yet. Upload and share images to view them here!",
                    style: regularTextStyle.copyWith(
                      color: grey,
                      height: .9,
                    ),
                    textAlign: TextAlign.start,
                  )
                : StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .where(
                          "userId",
                          isEqualTo: FirebaseServices().getCurrentUserId(),
                        )
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          PostModel postModel = PostModel.fromJson(snapshot.data!.docs[index]);
                          return ImageTile(
                            postModel: postModel,
                          );
                        },
                      );
                    },
                  );
          },
        )
      ],
    );
  }
}

class AccountStatusModule extends StatelessWidget {
  AccountStatusModule({
    Key? key,
  }) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• Account Status",
          style: semiBoldTextStyle.copyWith(
            fontSize: 14,
            color: black,
          ),
        ),
        SizedBox(
          height: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                initState: (_) {},
                builder: (_) {
                  return Text(
                    controller.user.imageList!.length.toString(),
                    style: semiBoldTextStyle.copyWith(
                      color: red,
                      fontSize: 30,
                      height: .6,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  "You currently have this many images on Billeddeling!!",
                  style: regularTextStyle.copyWith(height: 1, fontSize: 14, color: black.withOpacity(.6)),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
