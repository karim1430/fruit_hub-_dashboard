import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';

import '../utils/app_styles.dart';

class ConditionAndControls extends StatefulWidget {
  const ConditionAndControls({super.key, this.onCheckChanged});
  final ValueChanged<bool>? onCheckChanged;
  @override
  State<ConditionAndControls> createState() => _ConditionAndControlsState();
}

class _ConditionAndControlsState extends State<ConditionAndControls> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Is Feature Item?',
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
