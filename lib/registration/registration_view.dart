import 'package:flutter/material.dart';
import 'package:flutter_registration_app/configs/colors.dart';
import 'package:flutter_registration_app/configs/style_Text.dart';
import 'package:flutter_registration_app/helpers/navigator.dart';
import 'package:flutter_registration_app/landing/landing_view.dart';
import 'package:flutter_registration_app/registration/registration_controller.dart';
import 'package:flutter_registration_app/widgets/default_bottom.dart';
import 'package:flutter_registration_app/widgets/showToast.dart';
import 'package:flutter_registration_app/widgets/text_input.dart';
import 'package:provider/provider.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);
  static const routeName = 'registration';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegistrationController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Registration',
            style: StyleTexts.stylefont25,
          ),
        ),
        body: const FormText(),
      ),
    );
  }
}

class FormText extends StatelessWidget {
  const FormText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegistrationController>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              DefaultTextFromFile(
                controller: controller.nameController,
                lable: 'Enter your name',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'you must write your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultTextFromFile(
                controller: controller.idNationalController,
                lable: 'Enter your Identification number',
                maxLength: 10,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'you must write your Identification number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DefaultTextFromFile(
                controller: controller.numberController,
                maxLength: 8,
                lable: 'Enter your whatsApp number',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'you must write your whatsApp number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DefaultTextFromFile(
                controller: controller.placeOfElectionController,
                lable: 'Enter your Place of election ',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'you must write your Place of election';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 35,
              ),
              DefaultBottom(
                function: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.postDataUser(
                      name: controller.nameController.text,
                      whatsAppNumber: controller.numberController.text,
                      idNational: controller.idNationalController.text,
                      placeOfElection:
                          controller.placeOfElectionController.text,
                      dateTime: DateTime.now().toString(),
                    );
                    showToasts(
                        color: Colors.green,
                        text: 'Success add your information');
                    AppNavigator.push(LandingView.routeName);
                  }
                  ;
                },
                text: 'Ok',
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
