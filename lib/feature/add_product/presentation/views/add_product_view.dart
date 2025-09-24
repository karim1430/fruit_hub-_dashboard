import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/add_image/add_image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/add_product/add_product_repo.dart';
import 'package:fruit_hub_dashboard/core/utils/setup_get_it.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';
import '../../../../core/utils/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<AddImageRepo>(),
          getIt.get<AddProductRepo>(),
        ),
        child: AddProductViewBody(),
      ),
    );
  }
}
