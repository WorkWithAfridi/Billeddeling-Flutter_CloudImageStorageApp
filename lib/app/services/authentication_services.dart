import 'dart:developer';

import 'package:billeddeling/app/data/models/user_model.dart';
import 'package:billeddeling/app/services/firebase_services.dart';
import 'package:billeddeling/app/shared/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServices {
  AuthenticationServices._internal();
  static final AuthenticationServices _authenticationServices = AuthenticationServices._internal();
  factory AuthenticationServices() => _authenticationServices;

  Future<bool> isUserSignedIn() async {
    if (FirebaseServices().firebaseAuth.currentUser != null) {
      await FirebaseServices().getCurrentUser();
      return true;
    } else {
      return false;
    }
  }

  Future _storeUserData(UserCredential userCredential) async {
    UserModel currentUserModel = UserModel(
      userId: userCredential.user!.uid,
      name: userCredential.user!.displayName ?? userCredential.user!.email.toString(),
      profilePicUrl: userCredential.user!.photoURL ?? "",
      email: userCredential.user!.email ?? "",
      imageList: [],
    );
    try {
      await FirebaseServices().firebaseFirestore.collection('users').doc(FirebaseServices().getCurrentUserId()).set(
            currentUserModel.toJson(),
          );
      await FirebaseServices().getCurrentUser();
      return true;
    } on FirebaseException catch (err) {
      log(err.toString());
      return false;
    }
  }

  Future<bool> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential = await FirebaseServices().firebaseAuth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            await _storeUserData(userCredential);
          }
          await FirebaseServices().getCurrentUser();
          return true;
        }
      }
      return false;
    } on FirebaseException catch (err) {
      showCustomSnackbar(title: "Snap", message: err.message.toString());
      return false;
    } catch (err) {
      log(err.toString());
      return false;
    }
  }

  Future signinWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await FirebaseServices().firebaseAuth.signInWithCredential(facebookAuthCredential);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _storeUserData(userCredential);
        }
        await FirebaseServices().getCurrentUser();
        return true;
      }
      return false;
    } on FirebaseException catch (err) {
      showCustomSnackbar(title: "Snap", message: err.message.toString());
      return false;
    } catch (err) {
      return false;
    }
  }

  Future logoutUser() async {
    try {
      await FirebaseServices().firebaseAuth.signOut();
    } on FirebaseException catch (err) {
      log(err.toString());
      return false;
    }
    return true;
  }
}
