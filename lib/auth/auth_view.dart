import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration_app/auth/auth_controller.dart';
import 'package:flutter_registration_app/configs/colors.dart';
import 'package:flutter_registration_app/widgets/default_bottom.dart';
import 'package:flutter_registration_app/widgets/default_text.dart';
import 'package:flutter_registration_app/widgets/text_input.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);
  static const routeName = 'auth';
  @override
  Widget build(BuildContext context) {
    return const LogWidget();
  }
}

class LogWidget extends StatelessWidget {
  const LogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
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
                controller: controller.emailController,
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
                controller: controller.passwordController,
                obscureText: controller.isVisibilty ? false : true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please you must fill password here..';
                  }
                  return null;
                },
                suffix: IconButton(
                  onPressed: () {
                    controller.visibilty();
                  },
                  icon: controller.isVisibilty
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                lable: 'Password',
                prefix: Icons.password,
              ),
              const SizedBox(
                height: 30,
              ),
              ConditionalBuilder(
                condition: controller.isLoading,
                builder: (context) => DefaultBottom(
                  color: AppColor.primaryColor,
                  function: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.login(
                          email: controller.emailController.text,
                          password: controller.passwordController.text);
                      //   navigatorAndReplace(context, const LandingView());
                    }
                  },
                  text: 'Login',
                  isUpperCase: true,
                ),
                fallback: (context) => const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
