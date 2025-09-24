import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FileStorage implements StorageService {
  final storgeRefrence = FirebaseStorage.instance.ref();
  @override
  Future<String> uplaodImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    final fileRefrence = storgeRefrence.child('$path/$fileName.$extensionName');
    await fileRefrence.putFile(file);
    var fileUrl = fileRefrence.getDownloadURL();
    return fileUrl;
  }
}
