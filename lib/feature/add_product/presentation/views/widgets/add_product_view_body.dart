import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/functions/show_snack_bar.dart';
import 'package:fruit_hub_dashboard/core/widgets/condition_and_control.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_elevated_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/core/widgets/is_product_organic.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/manager/add_product/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  File? imageFile;
  bool isFeature = false;
  num avgRatting = 0;
  late num count;
  late num expiration;
  bool? isOrganic = false;
  late int numberOfCallories;
  late int unitAmount;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Product Name',
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Product Price',
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Product Code',
                  onSaved: (value) {
                    code = value!;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Product Description',
                  maxLines: 5,
                  onSaved: (value) {
                    description = value!.toLowerCase();
                  },
                ),
                SizedBox(height: 16),
                ConditionAndControls(
                  onCheckChanged: (value) {
                    isFeature = value;
                  },
                ),
                OrganicProductSwitcher(
                  onCheckChanged: (value) {
                    isOrganic = value;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Average Rating',
                  keyboardType: TextInputType.number,

                  onSaved: (value) {
                    avgRatting = num.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Count',
                  keyboardType: TextInputType.number,

                  onSaved: (value) {
                    count = num.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Expiration (days)',
                  keyboardType: TextInputType.number,

                  onSaved: (value) {
                    expiration = num.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Calories',
                  keyboardType: TextInputType.number,

                  onSaved: (value) {
                    numberOfCallories = int.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Unit Amount',
                  keyboardType: TextInputType.number,

                  onSaved: (value) {
                    unitAmount = int.parse(value!);
                  },
                ),
                SizedBox(height: 16),
                ImageField(
                  onFileChange: (image) {
                    imageFile = image!;
                  },
                ),
                SizedBox(height: 22),
                CustomElevatedButton(
                  buttonText: 'add product',
                  onPressed: () {
                    if (imageFile != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        AddProductInputEntity input = AddProductInputEntity(
                          name: name,
                          code: code,
                          description: description,
                          price: price,
                          imageFile: imageFile!,
                          isFeature: isFeature,
                          avgRatting: avgRatting,
                          count: count,
                          expiration: expiration,
                          numberOfCallories: numberOfCallories,
                          unitAmount: unitAmount,
                          reviews: [],
                        );
                        context.read<AddProductCubit>().addProduct(
                          addProductInputEntity: input,
                        );
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      showSnackBar(
                        context: context,
                        title: 'Please inside image',
                      );
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
