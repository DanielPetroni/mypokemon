import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraController extends GetxController {
  Rx<File> image = File('').obs;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    if (pickedFile != null) {
      File picikedCopy = await File(pickedFile.path).copy(path+'ImagesPokemons');
      image.value = File(picikedCopy.path);
      print(picikedCopy.path);
    } else {
      print('Nenhuma imagem selecionada.');
    }
  }
}
