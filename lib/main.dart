import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/providers/theme_provider.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';

import 'Core/root_manager.dart';
import 'Core/utiles/constance/app_styles.dart';
import 'Features/cart/presentation/controller/provider/cart_provider.dart';
import 'Features/profile/presentation/controller/provider/viewed_recently_provider.dart';
import 'Features/profile/presentation/controller/provider/wish_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishListProvider()),
        ChangeNotifierProvider(create: (_) => ViewedRecentlyProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppStyles.themeData(
            isDarkTheme: themeProvider.getIsDarkTheme,
            context: context,
          ),
          //home: const RootScreens(),
          onGenerateRoute: Routes.getRoute,
          initialRoute: Routes.loginRoute,
        );
      }),
    );
  }
}
