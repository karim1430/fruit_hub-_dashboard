import 'dart:developer';

import 'package:dartz/dartz.dart';
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
      return left(ServerFailure('Failed in add product'));
    }
  }
}
