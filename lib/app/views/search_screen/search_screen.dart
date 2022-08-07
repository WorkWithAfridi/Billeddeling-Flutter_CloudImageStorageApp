import 'package:billeddeling/app/data/constants/dimentions.dart';
import 'package:billeddeling/app/data/constants/fonts.dart';
import 'package:billeddeling/app/services/authentication_services.dart';
import 'package:billeddeling/app/services/firebase_services.dart';
import 'package:billeddeling/app/shared/widgets/custom_back_button.dart';
import 'package:billeddeling/app/views/search_screen/search_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constants/colors.dart';
import '../../data/models/post_model.dart';
import '../home/widgets/image_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController controller = Get.find();

  @override
  void dispose() {
    Get.delete<SearchController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: boldTextStyle,
        ),
        leading: const CustomBackButton(),
      ),
      body: Container(
        padding: customPadding,
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(),
            const SizedBox(
              height: 10,
            ),
            ResultModule()
          ],
        ),
      ),
    );
  }
}

class ResultModule extends StatelessWidget {
  ResultModule({
    Key? key,
  }) : super(key: key);

  final SearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.searchQuery.value == ""
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Search results",
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 14,
                      color: black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .where(
                          "userId",
                          isEqualTo: FirebaseServices().getCurrentUserId(),
                        )
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GetBuilder<SearchController>(
                        init: controller,
                        initState: (_) {},
                        builder: (_) {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              PostModel postModel = PostModel.fromJson(
                                  snapshot.data!.docs[index]);
                              return postModel.title
                                      .toLowerCase()
                                      .contains(controller.searchQuery)
                                  ? ImageTile(
                                      postModel: postModel,
                                    )
                                  : const SizedBox.shrink();
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  SearchTextField({
    Key? key,
  }) : super(key: key);

  final SearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: regularTextStyle,
      cursorColor: red,
      maxLines: 1,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onSubmitted: ((value) {
        controller.searchQuery.value = value.toLowerCase();
      }),
      onChanged: ((value) {
        controller.searchQuery.value = value.toLowerCase();
      }),
      decoration: InputDecoration(
        hintText: "Enter search query",
        hintStyle: regularTextStyle,
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            Get.context,
            color: grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            Get.context,
            color: red,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            Get.context,
            color: navyBlue,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(customBorderRadius),
        ),
        fillColor: navyBlue.withOpacity(.05),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
