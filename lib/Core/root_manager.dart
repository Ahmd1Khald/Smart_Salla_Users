import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/profile/presentation/views/viewed_recently_screen.dart';
import 'package:salla_users/Features/profile/presentation/views/wish_list_screen.dart';

import '../Features/auth/presentation/views/login_screen.dart';
import '../Features/auth/presentation/views/register/register_screen.dart';
import '../Features/auth/presentation/views/widgets/forget_pass.dart';
import '../Features/home/presentation/views/product_details.dart';
import '../Features/profile/presentation/views/orders_screen.dart';
import '../Features/root_screens/presentaiton/views/root_screens.dart';

class Routes {
  static const String splashRoute = "/";

  static const String loginRoute = "/login";

  static const String homeRoute = "/home";

  static const String productDetailsRoute = "/productDetails";

  static const String wishListRoute = "/wishlist";

  static const String viewedRecentlyRoute = "/viewedRecently";

  static const String registerRoute = "/RegisterScreen";

  static const String ordersRoute = "/OrdersScreen";

  static const String forgotPasswordScreenRoute = "/ForgotPasswordScreen";

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ProductDetails());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const RootScreens());
      case Routes.wishListRoute:
        return MaterialPageRoute(builder: (_) => const WishListScreen());
      case Routes.viewedRecentlyRoute:
        return MaterialPageRoute(builder: (_) => const ViewedRecentlyScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.ordersRoute:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case Routes.forgotPasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
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
