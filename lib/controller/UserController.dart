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

  void addPokemon(String id, String name, String type, String descryption, String pathImage,
      {Function onSucess, Function onFail}) async {
    listPokemon.add(Pokemon(name: name, type: type, descryption: descryption, pathImage: pathImage));
    Response response =
        await PokemonRepository().addPokemon(id, name, type, descryption, pathImage);
    if (response.statusCode == 200) {
      print(response.body);
      onSucess();
    } else if (response.statusCode == 400) {
      onFail(response.body["message"]);
    }
  }

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
}
