import 'package:image_picker/image_picker.dart';

class Imagepickerutils {
  final ImagePicker picker = ImagePicker();

  Future<XFile?>cameraCapture()async{
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }




}