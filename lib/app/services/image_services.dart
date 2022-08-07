import 'dart:typed_data';

import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class ImageServices {
  ImageServices._internal();
  static final ImageServices _imageServices = ImageServices._internal();
  factory ImageServices() => _imageServices;

  Future updatePost(String postId, String title, String date) async {
    await FirebaseServices()
        .firebaseFirestore
        .collection('posts')
        .doc(postId)
        .update({
      'title': title,
      'date': date,
    });
  }

  Future deletePost(PostModel postModel) async {
    await FirebaseServices()
        .firebaseFirestore
        .collection('posts')
        .doc(postModel.postId)
        .delete();
    await FirebaseServices().firebaseStorage.refFromURL(postModel.url).delete();
    _updateUserImageList(
      postId: postModel.postId,
      shouldAddPostIdToUserImageList: false,
    );
    return;
  }

  Future uploadPost(Uint8List image, String title, String date) async {
    try {
      String imageId = const Uuid().v1();
      String imageUrl = await _uploadImageToFirebaseStorage(
        image,
        imageId,
      );
      String postId = const Uuid().v4();
      PostModel postModel = PostModel(
        postId: postId,
        imageId: imageId,
        userId: FirebaseServices().firebaseAuth.currentUser!.uid,
        title: title,
        date: date,
        url: imageUrl,
      );
      await _uploadPostToFirebaseFirestore(postModel);
      return true;
    } on FirebaseException {
      return false;
    }
  }

  Future _updateUserImageList({
    required String postId,
    bool shouldAddPostIdToUserImageList = true,
  }) async {
    if (shouldAddPostIdToUserImageList) {
      _addPostIdToUserImageList(postId);
    } else {
      _removePostIdFromUserImageList(postId);
    }
    return;
  }

  Future _addPostIdToUserImageList(String postId) async {
    await FirebaseServices()
        .firebaseFirestore
        .collection('users')
        .doc(FirebaseServices().getCurrentUserId())
        .update({
      'imageList': FieldValue.arrayUnion([postId])
    });
  }

  Future _removePostIdFromUserImageList(String postId) async {
    await FirebaseServices()
        .firebaseFirestore
        .collection('users')
        .doc(FirebaseServices().getCurrentUserId())
        .update({
      'imageList': FieldValue.arrayRemove([postId]),
    });
  }

  Future _uploadImageToFirebaseStorage(Uint8List image, String imageId) async {
    Reference ref = FirebaseServices()
        .firebaseStorage
        .ref()
        .child("images")
        .child(FirebaseServices().getCurrentUserId())
        .child(imageId);
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snap = await uploadTask;
    String imageUrl = await snap.ref.getDownloadURL();
    return imageUrl;
  }

  Future _uploadPostToFirebaseFirestore(
    PostModel postModel,
  ) async {
    await FirebaseServices()
        .firebaseFirestore
        .collection("posts")
        .doc(postModel.postId)
        .set(postModel.toJson());
    await _updateUserImageList(postId: postModel.postId);
    return;
  }
}
