import 'dart:io';

abstract class StorageService {
  Future<String> uplaodImage(File file, String path);
}
