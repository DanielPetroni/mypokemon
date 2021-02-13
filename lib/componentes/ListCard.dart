import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/EditPokemon/EditPokemon.dart';
import 'package:mypokemon/Screens/ViewDetails/ViewDetailsScreen.dart';
import 'package:mypokemon/controller/UserController.dart';
import 'package:mypokemon/model/Pokemon.dart';
import 'package:mypokemon/utils.dart';

// ignore: must_be_immutable
class ListCard extends StatefulWidget {
  ListCard(this.index, this.listPokemon);
  int index;
  List listPokemon;
  @override
  _ListCardState createState() => _ListCardState();
}


class _ListCardState extends State<ListCard> {
  final userController = Get.put(UserController() ,permanent: true);
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    List<Pokemon> listPokemon = widget.listPokemon;
    return Card(
      elevation: 8.0,
      color: Utils().whatcolor(listPokemon[index].type),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '# 00${index + 1}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'PokemonSolid'),
              ),
              PopupMenuButton(
                  color: Colors.red[300],
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.back();
                                Get.to(EditPokemon(index));
                              }),
                        ),
                        PopupMenuItem(
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                              userController.deletePokemon(
                                  userController.user.value.id, index,
                                  onFail: (message) {
                                Get.rawSnackbar(
                                    backgroundColor: Colors.red,
                                    titleText: Text(
                                      message,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    messageText: Text(''));
                              });
                            },
                          ),
                        )
                      ]),
            ],
          ),
          Container(
            width: double.infinity,
            child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(listPokemon[index].name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Hero(
                    tag: '$index',
                    child: listPokemon[index].pathImage.isEmpty == true
                        ? Image.asset(
                            'assets/images/pokebola_fechada.png',
                            height: 80.0,
                            width: 80.0,
                          )
                        : Image.file(
                            File(listPokemon[index].pathImage),
                            height: 80.0,
                            width: 80.0,
                          ),
                  )
                ],
              ),
              onTap: () => Get.to(ViewDetailsScreen(listPokemon[index], index)),
            ),
          )
        ]),
      ),
    );
  }
}
