import 'dart:typed_data';

import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class ImageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  ImageServices._internal();
  static final ImageServices _imageServices = ImageServices._internal();
  factory ImageServices() => _imageServices;

  Future updatePost(String postId, String title, String date) async {
    await _firebaseFirestore.collection('posts').doc(postId).update({
      'title': title,
      'date': date,
    });
  }

  Future deletePost(PostModel postModel) async {
    await _firebaseFirestore.collection('posts').doc(postModel.postId).delete();
    await _storage.refFromURL(postModel.url).delete();
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
        userId: _firebaseAuth.currentUser!.uid,
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
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update({
        'imageList': FieldValue.arrayUnion([postId])
      });
    } else {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update({
        'imageList': FieldValue.arrayRemove([postId]),
      });
    }
    return;
  }

  Future _uploadImageToFirebaseStorage(Uint8List image, String imageId) async {
    Reference ref = _storage
        .ref()
        .child("images")
        .child(_firebaseAuth.currentUser!.uid)
        .child(imageId);
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snap = await uploadTask;
    String imageUrl = await snap.ref.getDownloadURL();
    return imageUrl;
  }

  Future _uploadPostToFirebaseFirestore(
    PostModel postModel,
  ) async {
    await _firebaseFirestore
        .collection("posts")
        .doc(postModel.postId)
        .set(postModel.toJson());
    await _updateUserImageList(postId: postModel.postId);
    return;
  }
}
