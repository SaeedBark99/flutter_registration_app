import 'package:flutter/material.dart';
import 'package:flutter_registration_app/configs/colors.dart';
import 'package:flutter_registration_app/configs/style_Text.dart';
import 'package:flutter_registration_app/registration/registration_controller.dart';
import 'package:flutter_registration_app/widgets/default_bottom.dart';
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
        body: FormText(),
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
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            DefaultTextFromFile(
              controller: controller.nameController,
              lable: 'Enter your name',
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultTextFromFile(
              controller: controller.idNationalController,
              lable: 'Enter your Identification number',
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultTextFromFile(
              controller: controller.numberController,
              lable: 'Enter your whatsApp number',
              //        controller.numberController.clear(),
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultTextFromFile(
              controller: controller.placeOfElectionController,
              lable: 'Enter your Place of election ',
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultBottom(
              function: () {
                controller.postDataUser(
                  name: controller.nameController.text,
                  whatsAppNumber: controller.numberController.text,
                  idNational: controller.idNationalController.text,
                  placeOfElection: controller.placeOfElectionController.text,
                );
              },
              text: 'Ok',
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
