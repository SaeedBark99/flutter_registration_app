import 'package:flutter/material.dart';
import 'package:flutter_registration_app/auth/auth_controller.dart';
import 'package:flutter_registration_app/configs/colors.dart';
import 'package:flutter_registration_app/landing/landing_view.dart';
import 'package:flutter_registration_app/widgets/default_bottom.dart';
import 'package:flutter_registration_app/widgets/default_text.dart';
import 'package:flutter_registration_app/widgets/navigator_page.dart';
import 'package:flutter_registration_app/widgets/text_input.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthController(),
      child: LogWidget(),
    );
  }
}

class LogWidget extends StatelessWidget {
  const LogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    final controller = context.watch<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DefaultText(
                  text: 'LOGIN',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
              const SizedBox(
                height: 10,
              ),
              const DefaultText(
                  text: 'Entre your email and password ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              const SizedBox(
                height: 30,
              ),
              DefaultTextFromFile(
                controller: emailController,
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please you must fill email here..';
                  }
                  return null;
                },
                lable: 'Email',
                prefix: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextFromFile(
                controller: passwordController,
                isPassword: controller.isPassword,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please you must fill password here..';
                  }
                  return null;
                },
                suffix: controller.suffix,
                onTap: () {
                  controller.changPasswordShow();
                },
                lable: 'Password',
                prefix: Icons.password,
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultBottom(
                color: AppColor.primaryColor,
                function: () {},
                text: 'LOgin',
                isUpperCase: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
