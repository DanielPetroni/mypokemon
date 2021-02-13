import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/NewPokemon/NewPokemon.dart';
import 'package:mypokemon/componentes/ListCard.dart';
import 'package:mypokemon/controller/UserController.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final c = Get.put(UserController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          height: size.height * 0.230,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Obx(
                () => Text(
                  'Seja bem vindo, ${c.user.value.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PokemonSolid',
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Como está meu treinador preferido?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic),
              ),
            ]),
          ),
        ),
      ]),
    ));
  }
}
