import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mypokemon/model/Pokemon.dart';

// ignore: must_be_immutable
class ViewDetailsScreen extends StatelessWidget {
  ViewDetailsScreen(this.pokemon, this.index);
  final Pokemon pokemon;
  int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: ListView(
        padding: EdgeInsets.only(top: size.height * 0.15),
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: '$index',
            child: pokemon.pathImage.isEmpty == true
                ? Image.asset(
                    'assets/images/pokebola_fechada.png',
                    height: size.height * 0.2,
                    width: size.height * 0.2,
                  )
                : Image.file(
                    File(pokemon.pathImage),
                    height: size.height * 0.2,
                    width: size.width * 0.2,
                  ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            height: size.height * 0.7,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'PokemonSolid',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  Text(pokemon.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'PokemonSolid',
                          fontSize: 24.0,
                          fontStyle: FontStyle.italic)),
                  SizedBox(height: 20.0),
                  Text('Tipo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'PokemonSolid',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  Text(pokemon.type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'PokemonSolid',
                          fontSize: 24.0,
                          fontStyle: FontStyle.italic)),
                  SizedBox(height: 20.0),
                  Text('Descrição',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'PokemonSolid',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  Text(pokemon.descryption,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'PokemonSolid',
                          fontSize: 24.0,
                          fontStyle: FontStyle.italic)),
                ]),
          ),
        ],
      ),
    );
  }
}
