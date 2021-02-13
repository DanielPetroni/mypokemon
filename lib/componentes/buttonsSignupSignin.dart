import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/controller/LoginController.dart';

class ButtonSignUpSignin extends StatefulWidget {
  @override
  _ButtonSignUpSigninState createState() => _ButtonSignUpSigninState();
}

class _ButtonSignUpSigninState extends State<ButtonSignUpSignin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (_) {
                return Text(
                  'SignIn',
                  style: TextStyle(
                      fontFamily: 'PokemonSolid',
                      fontSize: 22.0,
                      color: _.getSignin() ? Colors.black : Colors.red),
                );
              },
            ),
            onTap: () => Get.find<LoginController>().setSignin(false)),
        GestureDetector(
            child: GetBuilder<LoginController>(
              builder: (_) {
                return Text(
                  'SignUp',
                  style: TextStyle(
                      fontFamily: 'PokemonSolid',
                      fontSize: 22.0,
                      color: _.getSignin() ? Colors.red : Colors.black),
                );
              },
            ),
            onTap: () => Get.find<LoginController>().setSignin(true))
      ],
    );
  }
}
