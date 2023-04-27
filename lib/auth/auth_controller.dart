import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  var suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changPasswordShow() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    notifyListeners();
  }
}
