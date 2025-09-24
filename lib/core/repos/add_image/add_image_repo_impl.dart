import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/add_image/add_image_repo.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';

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
      return left(ServerFailure('Failed in upload image'));
    }
  }
}
