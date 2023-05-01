import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/landing/landing_model.dart';

class LandingController with ChangeNotifier {
  List<UserModel> dataUser = [];
  void getDataUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('people')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        dataUser.add(UserModel.formJson(element.data()));
        print('get dat data');
      });
    }).catchError((error) {
      print(error.toString());
    });
  }
}
