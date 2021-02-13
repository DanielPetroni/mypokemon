import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  Rx<File> image = File('').obs;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
       print(pickedFile.path);
      image.value = File(pickedFile.path);
      print(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
}
