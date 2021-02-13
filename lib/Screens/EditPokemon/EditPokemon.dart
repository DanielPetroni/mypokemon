import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypokemon/controller/CameraController.dart';
import 'package:mypokemon/controller/UserController.dart';

// ignore: must_be_immutable
class EditPokemon extends StatefulWidget {
  EditPokemon(this.index);
  int index;
  @override
  _EditPokemon createState() => _EditPokemon();
}

class _EditPokemon extends State<EditPokemon> {
  final userController = Get.put(UserController());
  final cameraController = Get.put(CameraController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _descryptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.red[200],
      body: ListView(
        padding: EdgeInsets.only(top: size.height * 0.15),
        children: [
          Image.asset('assets/images/pokebola.png', height: size.height * 0.2),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.02,
                right: size.width * 0.02,
                bottom: size.height * 0.02),
            child: Card(
                elevation: 8.0,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.03,
                        left: size.width * 0.02,
                        right: size.width * 0.02),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Editar pokemon',
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
                                  hintText:
                                      userController.listPokemon[index].name,
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
                  child: Text('Atualizar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center)),
              onTap: () {
                userController.updatePokemon(
                    userController.user.value.id,
                    userController.listPokemon[index].name,
                    _nameController.text,
                    _typeController.text,
                    _descryptionController.text,
                    cameraController.image.value.path, onSucess: (message) {
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
              })
        ],
      ),
    );
  }
}
