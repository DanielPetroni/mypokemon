import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/HomePage/HomePage.dart';
import 'package:mypokemon/Screens/Pokedex/PokedexScreen.dart';
import 'package:mypokemon/controller/NavigatorController.dart';

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationController = Get.put(NavigatorControler(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: navigationController.currentIndex == 0
            ? HomePageScreen()
            : PokedexScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: navigationController.updatePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Pokedex',
            ),
          ],
        ),
      ),
    );
  }
}