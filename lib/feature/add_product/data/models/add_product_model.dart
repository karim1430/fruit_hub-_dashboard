import 'dart:io';
import 'package:fruit_hub_dashboard/feature/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeature;
  String? imageUrl;
  num avgRatting = 0;
  num count = 0;
  final num expiration;
  bool isOrganic;
  final int numberOfCallories;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  AddProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeature,
    this.imageUrl,
    required this.avgRatting,
    required this.count,
    required this.expiration,
    required this.numberOfCallories,
    this.isOrganic = false,
    required this.unitAmount,
    required this.reviews,
    this.sellingCount = 0,
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
      imageUrl: addProductInputEntity.imageUrl,
      avgRatting: addProductInputEntity.avgRatting,
      count: addProductInputEntity.count,
      expiration: addProductInputEntity.expiration,
      isOrganic: addProductInputEntity.isOrganic,
      numberOfCallories: addProductInputEntity.numberOfCallories,
      unitAmount: addProductInputEntity.unitAmount,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      // Store only the image URL in Firestore, not the File instance
      'imageUrl': imageUrl,
      'isFeature': isFeature,
      'avgRatting': avgRatting,
      'count': count,
      'expiration': expiration,
      'numberOfCallories': numberOfCallories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()),
      'isOrganic': isOrganic,
      'sellingCount': sellingCount,
    };
  }
}
