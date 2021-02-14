import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraController extends GetxController {
  Rx<File> image = File('').obs;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    String fileName = pickedFile.path.split('/').last;
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    if (pickedFile != null) {
      Future<bool> exist = Directory('$path/ImagesPokemons').exists();
      if (exist != true) {
        Directory(path + '/imagespokemons').create()
            .then((Directory directory) {
          print('Criou');
        }).catchError((e) => print(e));
      }
      File picikedCopy =
          await File(pickedFile.path).copy('$path/imagespokemons/$fileName');
      image.value = File(picikedCopy.path);
    } else {
      print('Nenhuma imagem selecionada.');
    }
  }
}
