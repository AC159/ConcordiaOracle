import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:colorize/colorize.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthenticationProvider extends ChangeNotifier {

  User? currentUser;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late StreamSubscription<User?> currentUserStream;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  AuthenticationProvider() {
    currentUserStream = firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        currentUser = null;
        print(new Colorize("User is currently signed out!").blue());
      } else {
        currentUser = user;
        print(new Colorize("User is signed in!").blue());
        print(new Colorize(user.toString()).cyan());
      }
    });
  }

  void dispose() {
    super.dispose();
    currentUserStream.cancel();
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await firebaseAuth.signInWithCredential(credential);
  }

}
