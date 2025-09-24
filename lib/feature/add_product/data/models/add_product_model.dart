import 'dart:io';

import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeature;
  String? imageUrl;

  AddProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeature,
    this.imageUrl,
  });

  factory AddProductModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      imageFile: addProductInputEntity.imageFile,
      isFeature: addProductInputEntity.isFeature,
    );
  }

  toJson() {
    return {
      AddProductModel(
        name: name,
        code: code,
        description: description,
        price: price,
        imageFile: imageFile,
        isFeature: isFeature,
      ),
    };
  }
}
