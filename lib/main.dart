import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/Splash/SplashScreen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.red),
    home: SplashScreen(),
  ));
}
