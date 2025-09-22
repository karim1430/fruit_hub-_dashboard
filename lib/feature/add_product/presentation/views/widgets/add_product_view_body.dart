import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/condition_and_control.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_elevated_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/core/widgets/image_field.dart';

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
                ConditionAndControls(),
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
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      showErrors(context: context);
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

  void showErrors({required BuildContext context}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Please inside image')));
  }
}
