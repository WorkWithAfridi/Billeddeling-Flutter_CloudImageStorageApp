import 'dart:developer';

import 'package:billeddeling/app/data/models/user_model.dart';
import 'package:billeddeling/app/shared/widgets/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  UserModel? user;

  AuthenticationServices._internal();
  static final AuthenticationServices _authenticationServices =
      AuthenticationServices._internal();
  factory AuthenticationServices() => _authenticationServices;

  Future<bool> isUserSignedIn() async {
    if (_firebaseAuth.currentUser != null) {
      await getUserModel();
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel> getUserModel() async {
    User currentUser = _firebaseAuth.currentUser!;
    DocumentSnapshot userDoc =
        await _firebaseFirestore.collection("users").doc(currentUser.uid).get();
    user = UserModel.fromJson(userDoc);
    return user!;
  }

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
    try {
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
            await _signupWithGoogle(userCredential);
            await getUserModel();
            return true;
          } else {
            await getUserModel();
            return true;
          }
        }
      }
      return false;
    } on FirebaseException catch (err) {
      showCustomSnackbar(title: "Snap", message: err.message.toString());
      return false;
    } catch (err) {
      return false;
    }
  }

  Future _signupWithGoogle(UserCredential userCredential) async {
    return await _storeUserData(
      userId: userCredential.user!.uid,
      name: userCredential.user!.displayName ??
          userCredential.user!.email.toString(),
      profilePicUrl: userCredential.user!.photoURL ?? "",
      email: userCredential.user!.email ?? "",
    );
  }

  Future signinWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _signupWithFacebook(userCredential);
          await getUserModel();
          return true;
        } else {
          await getUserModel();
          return true;
        }
      }
      return false;
    } on FirebaseException catch (err) {
      showCustomSnackbar(title: "Snap", message: err.message.toString());
      return false;
    } catch (err) {
      return false;
    }
  }

  Future _signupWithFacebook(UserCredential userCredential) async {
    return await _storeUserData(
      userId: userCredential.user!.uid,
      name: userCredential.user!.displayName ??
          userCredential.user!.email.toString(),
      profilePicUrl: userCredential.user!.photoURL ?? "",
      email: userCredential.user!.email ?? "",
    );
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
