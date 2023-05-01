import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/auth/auth_controller.dart';
import 'package:flutter_registration_app/auth/auth_view.dart';
import 'package:flutter_registration_app/configs/theme.dart';
import 'package:flutter_registration_app/helpers/navigator.dart';
import 'package:flutter_registration_app/landing/landing_view.dart';
import 'package:flutter_registration_app/registration/registration_view.dart';
import 'package:flutter_registration_app/splash/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlutterRegistration());
}

class FlutterRegistration extends StatelessWidget {
  const FlutterRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppNavigator.key,
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          AuthView.routeName: (context) => const AuthView(),
          LandingView.routeName: (context) => const LandingView(),
          Registration.routeName: (context) => const Registration(),
        },
        debugShowCheckedModeBanner: false,
        theme: theme,
      ),
    );
  }
}
