import 'package:billeddeling/app/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FirebaseServices._internal();
  static final FirebaseServices _firebaseServices =
      FirebaseServices._internal();
  factory FirebaseServices() => _firebaseServices;

  late UserModel currentUser;

  Future getCurrentUser() async {
    User currentLoggedInUser = firebaseAuth.currentUser!;
    DocumentSnapshot userDoc = await firebaseFirestore
        .collection("users")
        .doc(currentLoggedInUser.uid)
        .get();
    currentUser = UserModel.fromJson(userDoc);
    return currentUser;
  }

  getCurrentUserId() => firebaseAuth.currentUser!.uid;
}
