import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_registration_app/registration/registration_model.dart';

class RegistrationController with ChangeNotifier {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final idNationalController = TextEditingController();
  final placeOfElectionController = TextEditingController();

  void postDataUser({
    required String name,
    required String whatsAppNumber,
    required String idNational,
    required String placeOfElection,
  }) {
    RegistrationModel model = RegistrationModel(
      name: name,
      whatsAppNumber: whatsAppNumber,
      uid: FirebaseAuth.instance.currentUser!.uid,
      idNational: idNational,
      placeOfElectin: placeOfElection,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('people')
        .add(model.toMap())
        .then((value) {
      print(value);
      print('success');
    }).catchError((error) {
      print(error.toString());
    });
  }
}
