import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _signin = false;
  bool _isFetching = false;
  bool getSignin() => _signin;
  bool getIsFetching() => _isFetching;
  void setSignin(bool signin) {
    _signin = signin;
    update();
  }

  void setFetching(bool fetching) {
    _isFetching = fetching;
    update();
  }
}
