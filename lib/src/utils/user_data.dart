import 'package:cloud_firestore/cloud_firestore.dart';

import 'authentication.dart';

class UserData {

  final uid = Auth().getCurrentUser().uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference favorite = FirebaseFirestore.instance.collection('users').doc(Auth().getCurrentUser().uid).collection('fav');

  Future<void> createUser(String name, String email, String phoneNumber ,String photoURL) async {
    await users.doc(uid).set({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
    });
  }

  getUserData() {
    return users.doc(uid).get();
  }

  Future<void> createFavoriteList() async {
    await favorite.doc(uid).set({
      'favList': [],
    });
  }

  getFavoriteList() {
    return favorite.doc(uid).get();
  }

  Future<void> addFavorite(String stock) async {
    await favorite.doc(uid).update({
      'favList': FieldValue.arrayUnion([stock]),
    });
  }

  Future<void> removeFavorite(String stock) async {
    await favorite.doc(uid).update({
      'favList': FieldValue.arrayRemove([stock]),
    });
  }

  
}