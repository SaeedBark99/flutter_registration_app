import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/auth/auth_view.dart';
import 'package:flutter_registration_app/helpers/navigator.dart';
import 'package:flutter_registration_app/landing/landing_view.dart';
import 'package:flutter_registration_app/widgets/showToast.dart';

class AuthController with ChangeNotifier {
  AuthController() {
    _inti();
  }

  var suffix = Icons.visibility_outlined;
  bool isVisibilty = false;
  bool isLoading = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void visibilty() {
    isVisibilty = !isVisibilty;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance.collection('users').doc();
      showToasts(
        color: Colors.green,
        text: 'success',
      );
      AppNavigator.pushReplacement(LandingView.routeName);
    }).catchError((e) {
      showToasts(
        color: Colors.red,
        text: e.toString(),
      );
    });
  }

  void _inti() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      AppNavigator.pushReplacement(LandingView.routeName);
    } else {
      AppNavigator.push(AuthView.routeName);
    }
  }
}
