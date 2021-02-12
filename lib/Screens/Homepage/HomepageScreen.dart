import 'package:flutter/material.dart';
import 'package:mypokemon/model/User.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatefulWidget {
  HomePageScreen(this.user);
  User user;
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 80.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seja bem vindo, ${widget.user.name}!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Veja a lista dos seus pokemons',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
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
                      Container(
                        height: 400.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              itemCount: widget.user.listPokemon.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Card(
                                    elevation: 8.0,
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '# ${index + 1}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              'Nome \n${widget.user.listPokemon[index].name}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Tipo: \n${widget.user.listPokemon[index].type}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ]),
                                    ));
                              }),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
