import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileCreator {
  final ImagePicker _picker;

  FileCreator._(this._picker);

  static Future<FileCreator> init() async {
    return FileCreator._(
      ImagePicker(),
    );
  }

  Future<File?> createFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) return File(photo.path);
    return null;
  }
}
