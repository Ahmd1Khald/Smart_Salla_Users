import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';

import '../Features/home/presentation/views/product_details.dart';
import '../Features/root_screens/presentaiton/views/root_screens.dart';

class Routes {
  static const String splashRoute = "/";

  static const String registerRoute = "/register";

  static const String homeRoute = "/home";

  static const String productDetailsRoute = "/productDetails";

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ProductDetails());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const RootScreens());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRoute),
              ),
              body: const Center(child: Text(AppStrings.noRoute)),
            ));
  }
}
