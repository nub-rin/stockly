import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stockly/src/utils/user_data.dart';

import '../pages/home.dart';
import '../pages/login.dart';

class Auth {

  final _auth = FirebaseAuth.instance;

  handleAuth() {
    return StreamBuilder(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const Login();
        }
      },
    );
  }

  signOut() {
    _auth.signOut();
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    _auth.signInWithCredential(authCredential);
  }

  signInWithEmailAndPassword(email, password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'invalid-email':
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid Email'),
                backgroundColor: Colors.red,
              ),
            );
          case 'user-not-found':
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User not found'),
                backgroundColor: Colors.red,
              ),
            );
          case 'wrong-password':
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wrong Password'),
                backgroundColor: Colors.red,
              ),
            );
          case 'user-disabled':
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User disabled'),
                backgroundColor: Colors.red,
              ),
            );
          default:
        }
      }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(authCredential);
      await UserData().createUser(
        userCredential.user!.displayName??'User',
        userCredential.user!.email!,
        userCredential.user!.phoneNumber??'',
        userCredential.user!.photoURL??'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      );
      await UserData().createFavoriteList();
    }
    catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return await _auth.signInWithCredential(authCredential);
  }

  signUpWithEmailAndPassword(email, password, context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await UserData().createUser(
        _auth.currentUser!.displayName??'User',
        _auth.currentUser!.email!,
        _auth.currentUser!.phoneNumber??'',
        _auth.currentUser!.photoURL??'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      );
      await UserData().createFavoriteList();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 1;
        case 'email-already-in-use':
          return 2;
        case 'weak-password':
          return 3;
        default:
      }
    }
    return 0;
  }

  getCurrentUser() {
    return _auth.currentUser!;
  }
}
