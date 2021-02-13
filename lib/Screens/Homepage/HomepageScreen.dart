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
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () => Get.to(NewPokemon()),
          icon: Icon(Icons.add),
          label: Text("Pokemon"),
        ),
        backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 80.0, left: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      'Segue abaixo sua pokédex',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 180.00),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => GridView.builder(
                                itemCount: c.listPokemon.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return ListCard(index, c.listPokemon);
                                }),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ]),
        ));
  }
}
