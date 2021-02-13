import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/controller/CameraController.dart';
import 'package:mypokemon/controller/UserController.dart';

class NewPokemon extends StatefulWidget {
  @override
  _NewPokemonState createState() => _NewPokemonState();
}

class _NewPokemonState extends State<NewPokemon> {
  final userController = Get.put(UserController(), permanent: true);
  final cameraController = Get.put(CameraController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _descryptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: ListView(
        padding: EdgeInsets.only(top: size.height * 0.15),
        children: [
          Image.asset('assets/images/pokebola.png', height: 200.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Card(
                elevation: 8.0,
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Novo pokemon',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'PokemonSolid', fontSize: 22.0),
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "Campo nome é obrigatório!";
                                  else
                                    return null;
                                },
                                controller: _nameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome',
                                )),
                            SizedBox(height: 10.0),
                            TextFormField(
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "Campo tipo é obrigatório!";
                                  else
                                    return null;
                                },
                                controller: _typeController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Tipo',
                                )),
                            SizedBox(height: 10.0),
                            TextFormField(
                                controller: _descryptionController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty)
                                    return "Campo descrição é obrigatório!";
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Descrição',
                                )),
                            SizedBox(height: 10.0),
                            Obx(() => cameraController.image.value.path.isEmpty
                                ? IconButton(
                                    icon: Icon(Icons.add_a_photo),
                                    onPressed: () =>
                                        cameraController.getImage(),
                                    color: Colors.red,
                                  )
                                : Image.file(
                                    cameraController.image.value,
                                    height: 150,
                                  ))
                          ]),
                    ))),
          ),
          GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Adicionar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center)),
              onTap: () {
                if (_formKey.currentState.validate()) {
                  userController.addPokemon(
                      userController.user.value.id,
                      _nameController.text,
                      _typeController.text,
                      _descryptionController.text, 
                      cameraController.image.value.path,
                      onSucess: () {
                    Get.back();
                  }, onFail: (message) {
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
                }
              })
        ],
      ),
    );
  }
}
