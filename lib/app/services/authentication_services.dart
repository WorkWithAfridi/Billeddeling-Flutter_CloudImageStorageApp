import 'dart:developer';

import 'package:billeddeling/app/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthenticationServices._internal();
  static final AuthenticationServices _authenticationServices =
      AuthenticationServices._internal();
  factory AuthenticationServices() => _authenticationServices;

  Future<UserModel> getUserModel() async {
    User currentUser = _firebaseAuth.currentUser!;
    DocumentSnapshot userDoc =
        await _firebaseFirestore.collection("users").doc(currentUser.uid).get();
    user = UserModel.fromJson(userDoc);
    return user!;
  }

  UserModel? user;

  Future _storeUserData({
    required String userId,
    required String name,
    String email = "",
    required String profilePicUrl,
    List<String> imageList = const [],
  }) async {
    UserModel currentUserModel = UserModel(
      userId: userId,
      name: name,
      profilePicUrl: profilePicUrl,
      email: email,
      imageList: imageList,
    );
    try {
      await _firebaseFirestore.collection('users').doc(userId).set(
            currentUserModel.toJson(),
          );
      await getUserModel();
      return true;
    } on FirebaseException catch (err) {
      log(err.toString());
      return false;
    }
  }

  Future<bool> signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          return await signupWithGoogle(userCredential);
        } else {
          await getUserModel();
          return true;
        }
      }
    }
    return false;
  }

  Future signupWithGoogle(UserCredential userCredential) async {
    return await _storeUserData(
      userId: userCredential.user!.uid,
      name: userCredential.user!.displayName ??
          userCredential.user!.email.toString(),
      profilePicUrl: userCredential.user!.photoURL ?? "",
      email: userCredential.user!.email ?? "",
    );
  }

  Future loginWithFacebook() async {}

  Future<bool> isUserSignedIn() async {
    if (_firebaseAuth.currentUser != null) {
      await getUserModel();
      return true;
    } else {
      return false;
    }
  }

  Future logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseException catch (err) {
      log(err.toString());
      return false;
    }
    return true;
  }
}
