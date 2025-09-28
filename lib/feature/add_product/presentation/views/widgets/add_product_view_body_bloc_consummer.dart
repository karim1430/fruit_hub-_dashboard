import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/functions/show_snack_bar.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocConsummer extends StatelessWidget {
  const AddProductViewBodyBlocConsummer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          showSnackBar(title: state.errMessage, context: context);
        }
        if (state is AddProductSuccess) {
          showSnackBar(title: 'add product successfully', context: context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
