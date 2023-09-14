import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/providers/theme_provider.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/order_provider.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';

import 'Core/utiles/constance/app_styles.dart';
import 'Features/cart/presentation/controller/provider/cart_provider.dart';
import 'Features/home/presentation/controller/provider/user_provider.dart';
import 'Features/profile/presentation/controller/provider/viewed_recently_provider.dart';
import 'Features/profile/presentation/controller/provider/wish_list_provider.dart';
import 'Features/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return MaterialApp(
            //     debugShowCheckedModeBanner: false,
            //     home: Scaffold(
            //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //       body: const Center(
            //         child: SpinKitPouringHourGlass(
            //           color: Colors.orangeAccent,
            //           size: 50,
            //         ),
            //       ),
            //     ),
            //   );
            // }
            if (snapshot.hasError) {
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: SelectableText(
                        "An Error has been occured ${snapshot.error}"),
                  ),
                ),
              );
            }
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => ThemeProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ProductProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => CartProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => WishListProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ViewedRecentlyProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => UserProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => OrdersProvider(),
                ),
              ],
              child: Consumer<ThemeProvider>(
                builder: (
                  context,
                  themeProvider,
                  child,
                ) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: AppStrings.appName,
                    theme: AppStyles.themeData(
                        isDarkTheme: themeProvider.getIsDarkTheme,
                        context: context),
                    home: const SplashScreen(),
                  );
                },
              ),
            );
          }),
    );
  }
}
