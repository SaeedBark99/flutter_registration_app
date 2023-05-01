import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/auth/auth_model.dart';
import 'package:flutter_registration_app/auth/auth_view.dart';
import 'package:flutter_registration_app/helpers/navigator.dart';
import 'package:flutter_registration_app/landing/landing_view.dart';

class AuthController with ChangeNotifier {
  AuthController() {
    _inti();
  }

  var suffix = Icons.visibility_outlined;
  bool isVisibilty = false;
  bool isLoading = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void visibilty() {
    isVisibilty = !isVisibilty;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
    //  required placeOfElectin,
  }) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUsers(uid: value.user!.uid, email: email);
      notifyListeners();
      AppNavigator.pushReplacement('landing');
    }).catchError((e) {
      print(e.toString());
    });
  }

  void createUsers({
    required String email,
    required String uid,
  }) {
    LoginModel model = LoginModel(
      uid: uid,
      email: email,
    );
    FirebaseFirestore.instance.collection('users').doc(uid).set(model.toMap());
  }

  void _inti() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      AppNavigator.push(LandingView.routeName);
    } else {
      AppNavigator.push(AuthView.routeName);
    }
  }
}
