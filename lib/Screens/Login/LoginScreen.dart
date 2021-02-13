import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/Screens/Homepage/HomepageScreen.dart';
import 'package:mypokemon/componentes/buttonsSignupSignin.dart';
import 'package:mypokemon/controller/LoginController.dart';
import 'package:mypokemon/controller/UserController.dart';
import 'package:mypokemon/model/User.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final c = Get.put(UserController(), permanent: true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.1),
        child: ListView(children: [
          Image.asset(
            'assets/images/ash.png',
            height: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 8.0,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 15.0),
                child: Column(children: [
                  ButtonSignUpSignin(),
                  SizedBox(height: 10.0),
                  GetBuilder<LoginController>(
                    init: LoginController(),
                    builder: (_) {
                      return Visibility(
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Nome'),
                        ),
                        visible: _.getSignin(),
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'E-mail')),
                  SizedBox(height: 10.0),
                  TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Senha')),
                ]),
              ),
            ),
          ),
          GetBuilder<LoginController>(
            builder: (
              _,
            ) {
              return _.getSignin()
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                  color: _.getIsFetching()
                                      ? Colors.red[400]
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text('Cadastrar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center)),
                          onTap: _.getIsFetching()
                              ? null
                              : () {
                                  Get.find<LoginController>().setFetching(true);
                                  UserController().signup(
                                      _nameController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                      onSucess: (message) {
                                    Get.find<LoginController>()
                                        .setFetching(false);
                                    Get.rawSnackbar(
                                        backgroundColor: Colors.green,
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
                                }))
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  color: _.getIsFetching()
                                      ? Colors.red[400]
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text('Entrar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center)),
                          onTap: _.getIsFetching()
                              ? null
                              : () {
                                  Get.find<LoginController>().setFetching(true);
                                  UserController().signin(_emailController.text,
                                      _passwordController.text,
                                      onSucess: (User user) {
                                    c.setUser(user);
                                    c.setList(user.listPokemon);
                                    Get.off(HomePageScreen());
                                  }, onFail: (message) {
                                    Get.find<LoginController>()
                                        .setFetching(false);
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
                                }),
                    );
            },
          ),
        ]),
      ),
    );
  }
}
