import 'package:flutter/material.dart';
import 'package:flutter_registration_app/configs/colors.dart';
import 'package:flutter_registration_app/configs/style_Text.dart';
import 'package:flutter_registration_app/helpers/navigator.dart';
import 'package:flutter_registration_app/landing/landing_controller.dart';
import 'package:flutter_registration_app/registration/registration_view.dart';
import 'package:provider/provider.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  static const routeName = 'landing';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LandingController()..getDataUser(),
      lazy: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'List',
            style: StyleTexts.stylefont25,
          ),
          centerTitle: true,
        ),
        floatingActionButton: CircleAvatar(
          radius: 25,
          backgroundColor: AppColor.primaryColor,
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              AppNavigator.push(Registration.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ),
        body: Consumer<LandingController>(
          builder: (_, model, child) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListItem(
                name: model.dataUser[index].name!,
                city: model.dataUser[index].placeOfElectin!,
                idNational: model.dataUser[index].idNational!,
                whatsAppNumber: model.dataUser[index].whatsAppNumber!,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 2,
            ),
            itemCount: model.dataUser.length,
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.name,
    required this.whatsAppNumber,
    required this.idNational,
    required this.city,
  }) : super(key: key);
  final String name;
  final String whatsAppNumber;
  final String idNational;
  final String city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Card(
        elevation: 0.5,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 10),
          width: double.infinity,
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: StyleTexts.stylefont25),
              const SizedBox(
                height: 5,
              ),
              Text('ID_ $idNational'),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_city_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(city),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.chat_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(whatsAppNumber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
