import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/Login/LoginScreen.dart';
import 'package:mypokemon/controller/UserController.dart';
import 'package:mypokemon/utils.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final userController = Get.put(UserController(), permanent: true);

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
            padding: EdgeInsets.only(
                top: size.height * 0.08, left: size.width * 0.05),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seja bem vindo, ${userController.user.value.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PokemonSolid',
                        fontSize: 20.0,
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          userController.onClose();
                          Get.off(LoginScreen());
                        })
                  ],
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
        SizedBox(height: 10.0),
        Text('Último pokemon adicionado',
            style: TextStyle(
                color: Colors.red,
                fontFamily: 'PokemonSolid',
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 5.0),
        userController.listPokemon.length > 0
            ? Card(
                elevation: 10.0,
                color: Utils().whatcolor(userController.listPokemon.last.type),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Obx(() => Text(userController.listPokemon.last.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                      SizedBox(height: 10.0),
                      Obx(
                        () => userController
                                    .listPokemon.last.pathImage.isEmpty !=
                                true
                            ? Image.file(
                                File(userController.listPokemon.last.pathImage),
                                height: size.height * 0.2,
                                width: size.width * 0.5)
                            : Image.asset('assets/images/pokebola_fechada.png',
                                height: size.height * 0.2,
                                width: size.width * 0.5),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Image.asset('assets/images/zzzzzzz.png',
                      height: size.height * 0.2, width: size.width * 0.5),
                  Text('Nenhum pokemon adicionado ainda',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
        SizedBox(height: 80.0),
        Text('Primeiro pokemon adicionado',
            style: TextStyle(
                color: Colors.red,
                fontFamily: 'PokemonSolid',
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        userController.listPokemon.length > 0
            ? Card(
                elevation: 10.0,
                color: Utils().whatcolor(userController.listPokemon[0].type),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Obx(() => Text(userController.listPokemon[0].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                      SizedBox(height: 10.0),
                      Obx(
                        () => userController.listPokemon[0].pathImage.isEmpty !=
                                true
                            ? Image.file(
                                File(userController.listPokemon[0].pathImage),
                                height: size.height * 0.2,
                                width: size.width * 0.5)
                            : Image.asset('assets/images/pokebola_fechada.png',
                                height: size.height * 0.2,
                                width: size.width * 0.5),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                Image.asset('assets/images/zzzzzzz.png',
                      height: size.height * 0.2, width: size.width * 0.5),
                  Text('Nenhum pokemon adicionado ainda',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
        SizedBox(height: 10.0),
        userController.listPokemon.length > 0
            ? Text('Pokemons adicionados: ${userController.listPokemon.length}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold))
            : Container(),
        SizedBox(height: 5.0),
      ]),
    ));
  }
}
