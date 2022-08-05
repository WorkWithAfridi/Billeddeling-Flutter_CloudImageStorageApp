import 'dart:typed_data';

import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:billeddeling/app/services/authentication_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class ImageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  uploadImage(Uint8List image, String title, String date) async {
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
        userId: _auth.currentUser!.uid,
        title: title,
        date: date,
        url: imageUrl,
      );
      _firebaseFirestore
          .collection("posts")
          .doc(postId)
          .set(postModel.toJson());
      await AuthenticationServices().updateUserImageList(postId, 'add');
      return true;
    } on FirebaseException {
      return false;
    }
  }

  Future _uploadImageToFirebaseStorage(Uint8List image, String imageId) async {
    Reference ref = _storage
        .ref()
        .child("images")
        .child(_auth.currentUser!.uid)
        .child(imageId);
    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snap = await uploadTask;
    String imageUrl = await snap.ref.getDownloadURL();
    return imageUrl;
  }
}
