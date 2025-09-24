import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';

abstract class AddImageRepo {
  Future<Either<Failure, String>> addImage({required File image});
}
