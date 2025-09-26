import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';

import '../utils/app_styles.dart';

class OrganicProductSwitcher extends StatefulWidget {
  const OrganicProductSwitcher({super.key, this.onCheckChanged});
  final ValueChanged<bool>? onCheckChanged;
  @override
  State<OrganicProductSwitcher> createState() => _OrganicProductSwitcherState();
}

class _OrganicProductSwitcherState extends State<OrganicProductSwitcher> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Is Product Organic?',
          style: AppStyles.textStyleSemi13.copyWith(color: kLightPrimaryColor),
        ),
        Spacer(),
        Checkbox(
          checkColor: Colors.white,
          activeColor: kPrimaryColor,
          value: check,
          onChanged: (value) {
            if (value == true) {
              check = true;
              widget.onCheckChanged?.call(check);
              setState(() {});
            } else {
              check = false;
              widget.onCheckChanged?.call(check);
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
