import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/registration/registration_model.dart';

class LandingController with ChangeNotifier {
  List<RegistrationModel> dataUser = [];
  void getDataUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('people')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .listen((value) {
      dataUser = [];
      value.docs.forEach((element) {
        dataUser.add(RegistrationModel.formJson(element.data()));
        notifyListeners();
      });
    });
  }
}
