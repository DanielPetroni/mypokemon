import 'package:get/get.dart';
import 'package:mypokemon/const.dart';

class PokemonRepository extends GetConnect {
  Future<Response> addPokemon(String id, String namePokemon, String typePokemon,
      String descrypitionPokemon, String pathImage) async {
    try {
      Response response = await post(url + 'addPokemon', {
        "namePokemon": namePokemon,
        "typePokemon": typePokemon,
        "descryptionPokemon": descrypitionPokemon,
        "pathImage": pathImage
      }, headers: {
        "id": id
      });
      return response;
    } catch (e) {
      print(e.printError());
      return e;
    }
  }
}
