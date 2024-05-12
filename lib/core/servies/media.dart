import 'dart:io';
// import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class Media {

  static final ImagePicker picker = ImagePicker();

  static Future<File?> pickImageFromCamera() async {
    final image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 30);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  static Future<File?> pickImageFromGallary() async {
    final image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }



}
