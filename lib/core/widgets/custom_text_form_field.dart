import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';

import '../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    required this.labelText,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.maxLines = 1,
  });
  final TextInputType? keyboardType;
  final String labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLines;
  // final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      // key: formKey,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'هذا $labelText مطلوب';
            }
            return null;
          },

      style: AppStyles.textStyleSemi16.copyWith(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color(0xffF9FAFA),
        filled: true,
        suffixIcon: suffixIcon,
        labelStyle: AppStyles.textStyleBold13,
        labelText: labelText,
        // hintStyle: AppStyles.textStyleBold13,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }
}
