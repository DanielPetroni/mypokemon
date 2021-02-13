import 'package:get/get.dart';
import 'package:mypokemon/model/Pokemon.dart';
import 'package:mypokemon/model/User.dart';
import 'package:mypokemon/repository/PokemonRepository.dart';
import 'package:mypokemon/repository/UserRepository.dart';

class UserController extends GetxController {
  Rx<User> user = User(name: 'Diana').obs;
  RxList<Pokemon> listPokemon = [Pokemon()].obs;
  void setUser(User useer) => user.value = useer;
  void setList(List<Pokemon> list) => listPokemon.assignAll(list);

  Future<void> signin(String email, String password,
      {Function onSucess, Function onFail}) async {
    Response response = await UserRepository().fetchuser(email, password);
    if (response.statusCode == 200) {
      onSucess(User.fromJson(response.body));
    } else if (response.statusCode == 400) {
      print(response.body);
      onFail(response.body["message"]);
    }
  }

  Future<void> signup(String name, String email, String password,
      {Function onSucess}) async {
    Response response =
        await UserRepository().signupUser(name, email, password);
    onSucess(response.body["message"]);
  }

  void addPokemon(
      String id, String name, String type, String descryption, String pathImage,
      {Function onSucess, Function onFail}) async {
    listPokemon.add(Pokemon(
        name: name,
        type: type,
        descryption: descryption,
        pathImage: pathImage));
    Response response = await PokemonRepository()
        .addPokemon(id, name, type, descryption, pathImage);
    if (response.statusCode == 200) {
      print(response.body);
      onSucess();
    } else if (response.statusCode == 400) {
      onFail(response.body["message"]);
    }
  }

  void updatePokemon(String id, String name, String newname, String type,
      String descryption, String pathImage,
      {Function onSucess, Function onFail}) async {
    listPokemon.forEach((pokemon) {
      if (pokemon.name == name) {
        print('Achou pokemon');
        newname.isEmpty != true ? pokemon.name = newname : null;
        type.isEmpty != true ? pokemon.type = type : null;
        descryption.isEmpty != true ? pokemon.descryption = descryption : null;
        pathImage.isEmpty != true
            ? pokemon.pathImage = pathImage
            : pokemon.pathImage = '';
      }
    });
    listPokemon.refresh();
    Response response = await PokemonRepository()
        .updatePokemon(id, name, newname, type, descryption, pathImage);
    if (response.statusCode == 200) {
      print(response.body);
      onSucess(response.body["message"]);
    } else if (response.statusCode == 400) {
      onFail(response.body["message"]);
    }
  }

  void deletePokemon(String id, int index,
      {Function onSucess, Function onFail}) async {
    listPokemon.removeAt(index);
    print('Achou pokemon');
    listPokemon.refresh();
    Response response = await PokemonRepository().deletePokemon(id, index);
    if (response.statusCode == 200) {
      print(response.body);
      onSucess(response.body["message"]);
    } else if (response.statusCode == 400) {
      onFail(response.body["message"]);
    }
  }
}
