import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/routing/routes.dart';
import 'package:fruit_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return _createRoute(const DashboardView());

      case Routes.homeView:
        return _createRoute(const Scaffold());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
