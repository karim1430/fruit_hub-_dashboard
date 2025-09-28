import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/add_product/add_product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/firebase_services.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/models/add_product_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  final FirebaseServices firebaseServices;

  AddProductRepoImpl(this.firebaseServices);
  @override
  Future<Either<Failure, void>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    try {
      var product = await firebaseServices.addData(
        path: BackendEndpoint.addProduct,
        data: AddProductModel.fromEntity(addProductInputEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      log('Failed in add product :${e.toString()}');
      if (e is FirebaseException) {
        return left(ServerFailure(e.message ?? ''));
      } else if (e is SocketException) {
        return left(ServerFailure('No Internet Connection'));
      } else if (e is HttpException) {
        return left(ServerFailure(e.message));
      } else if (e is FormatException) {
        return left(ServerFailure('Bad response format'));
      } else if (e is FileSystemException) {
        return left(ServerFailure(e.message));
      }
      return left(ServerFailure('Failed in add product'));
    }
  }
}
