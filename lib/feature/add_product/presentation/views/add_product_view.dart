import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';

import '../../../../core/utils/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Product'),
      body: AddProductViewBody(),
    );
  }
}
