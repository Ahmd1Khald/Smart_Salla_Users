import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/providers/theme_provider.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';
import 'package:salla_users/firebase_options.dart';

import 'Core/utiles/constance/app_styles.dart';
import 'Features/cart/presentation/controller/provider/cart_provider.dart';
import 'Features/home/presentation/controller/provider/user_provider.dart';
import 'Features/profile/presentation/controller/provider/viewed_recently_provider.dart';
import 'Features/profile/presentation/controller/provider/wish_list_provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            home: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: const Center(
                child: SpinKitPouringHourGlass(
                  color: Colors.orangeAccent,
                  size: 50,
                ),
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
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
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(create: (_) => WishListProvider()),
            ChangeNotifierProvider(create: (_) => ViewedRecentlyProvider()),
            ChangeNotifierProvider(create: (_) => UserProvider()),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                theme: AppStyles.themeData(
                  isDarkTheme: themeProvider.getIsDarkTheme,
                  context: context,
                ),
                //onGenerateRoute: Routes.getRoute,
                //initialRoute: Routes.loginRoute,
                home: const RoutScreens(),
              );
            },
          ),
        );
      },
    );
  }

  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //     future: Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     ),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const MaterialApp(
  //           debugShowCheckedModeBanner: false,
  //           title: AppStrings.appName,
  //           home: Scaffold(
  //             body: Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //           ),
  //         );
  //       } else if (snapshot.hasError) {
  //         return MaterialApp(
  //           debugShowCheckedModeBanner: false,
  //           title: AppStrings.appName,
  //           home: Scaffold(
  //             body: Center(
  //               child: SelectableText(
  //                   "An Error has been occured ${snapshot.error}"),
  //             ),
  //           ),
  //         );
  //       }
  //       return MultiProvider(
  //         providers: [
  //           ChangeNotifierProvider(create: (_) => ThemeProvider()),
  //           ChangeNotifierProvider(create: (_) => ProductProvider()),
  //           ChangeNotifierProvider(create: (_) => CartProvider()),
  //           ChangeNotifierProvider(create: (_) => WishListProvider()),
  //           ChangeNotifierProvider(create: (_) => ViewedRecentlyProvider()),
  //           ChangeNotifierProvider(create: (_) => UserProvider()),
  //         ],
  //         child:
  //             Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
  //           return MaterialApp(
  //             debugShowCheckedModeBanner: false,
  //             title: AppStrings.appName,
  //             theme: AppStyles.themeData(
  //               isDarkTheme: themeProvider.getIsDarkTheme,
  //               context: context,
  //             ),
  //             onGenerateRoute: Routes.getRoute,
  //             //initialRoute: Routes.loginRoute,
  //             home: AuthMiddleWare.loginMiddleware(),
  //           );
  //         }),
  //       );
  //     },
  //   );
  // }
}
