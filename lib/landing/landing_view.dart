import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_registration_app/configs/style_Text.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
        child: IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => const ListItem(),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 2,
        ),
        itemCount: 10,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Card(
        elevation: 0.2,
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Saeed', style: StyleTexts.stylefont25),
              const SizedBox(
                height: 5,
              ),
              const Text('ID_1254'),
              const SizedBox(
                height: 5,
              ),
              const Text('Nouackchott'),
              const SizedBox(
                height: 5,
              ),
              const Text('+222 42517869'),
            ],
          ),
        ),
      ),
    );
  }
}
