import 'package:get/get.dart';

class NavigatorControler extends GetxController {
  final currentIndex = 0.obs;

  void updatePage(int index) {
    currentIndex.value = index;
  }
}
