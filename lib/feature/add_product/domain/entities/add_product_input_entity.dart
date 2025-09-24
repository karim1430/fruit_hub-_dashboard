import 'dart:io';

import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeature;
  String? imageUrl;
  final num avgRatting;
  final num count;
  final num expiration;
  bool isOrganic;
  final int numberOfCallories;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  AddProductInputEntity({
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
  });
}
