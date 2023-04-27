import 'package:flutter/material.dart';
import 'package:flutter_registration_app/auth/auth_view.dart';

void main() {
  // await Firebase.initializeApp();
  runApp(const FlutterRegistration());
}

class FlutterRegistration extends StatelessWidget {
  const FlutterRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthView(),
    );
  }
}
