import 'dart:io';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService implements StorageService {
  static late Supabase _supabase;
  static Future<void> createBucket(String name) async {
    try {
      final buckets = await _supabase.client.storage.listBuckets();
      final bucketAlreadyExists = buckets.any((bucket) => bucket.name == name);
      if (!bucketAlreadyExists) {
        await _supabase.client.storage.createBucket(name);
      }
    } on StorageException catch (e) {
      if (e.statusCode == '409') {
        return;
      }
      rethrow;
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kUrlSupabase,
      anonKey: kKeySupabase,
    );
  }

  @override
  Future<String> uplaodImage(File file, String path) async {
    String fileName = b.basenameWithoutExtension(file.path);
    String extensionName = b.extension(file.path);
    final result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName$extensionName', file);

    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName$extensionName');

    return publicUrl;
  }
}
