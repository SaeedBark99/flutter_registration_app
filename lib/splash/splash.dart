import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/helpers/navigator.dart';

class SplashView extends StatelessWidget {
  static const routeName = '/';
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            AppNavigator.pushReplacement('auth');
          },
          child: const Text(
            'Splash',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
