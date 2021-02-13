import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/HomePage/HomePage.dart';
import 'package:mypokemon/Screens/Pokedex/PokedexScreen.dart';

class NavigatorControler extends GetxController {
  final currentIndex = 0.obs;

  List<Widget> pages = [HomePageScreen(), PokedexScreen()];

  void updatePage(int index) {
    currentIndex.value = index;
  }
}
