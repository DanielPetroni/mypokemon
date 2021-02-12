import 'package:get/get.dart';
import 'package:mypokemon/const.dart';

class UserRepository extends GetConnect {
  String teste;
  Future<Response> fetchuser(String email, String password) async {
    print('entou');
    try {
      Response response =
          await post(url + 'signin', {"email": email, "password": password});
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<Response> signupUser(
      String name, String email, String password) async {
    try {
      Response response = await post(
          url + 'signup', {"name": name, "email": email, "password": password});
      return response;
    } catch (e) {
      return e;
    }
  }
}
