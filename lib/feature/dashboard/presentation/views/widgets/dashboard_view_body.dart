import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/routing/routes.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_elevated_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonText: 'Next',
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.addProduct);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
