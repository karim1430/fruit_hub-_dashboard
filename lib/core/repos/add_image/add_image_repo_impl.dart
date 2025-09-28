import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/add_image/add_image_repo.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../services/storage_service.dart';

class AddImageRepoImpl implements AddImageRepo {
  final StorageService storageService;

  AddImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> addImage({required File image}) async {
    try {
      var fileImage = await storageService.uplaodImage(
        image,
        BackendEndpoint.images,
      );
      return right(fileImage);
    } catch (e) {
      log('failed in upload image : ${e.toString()}');
      if (e is StorageException) {
        return left(ServerFailure(e.message));
      } else if (e is FileSystemException) {
        return left(ServerFailure(e.message));
      } else if (e is SocketException) {
        return left(ServerFailure('No Internet Connection'));
      } else if (e is HttpException) {
        return left(ServerFailure(e.message));
      } else if (e is FormatException) {
        return left(ServerFailure('Bad response format'));
      }
      return left(ServerFailure('Failed in upload image'));
    }
  }
}
