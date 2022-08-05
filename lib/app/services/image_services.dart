import 'dart:typed_data';

import 'package:billeddeling/app/data/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class ImageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  uploadImage(Uint8List image) async {
    String imageUrl = await _uploadImageToFirebaseStorage(image);
    PostModel postModel = PostModel(imageId: imageId, userId: userId, title: title, date: date, url: url)
  }

  Future _uploadImageToFirebaseStorage(Uint8List image) async {
    String imageId = const Uuid().v1();
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
