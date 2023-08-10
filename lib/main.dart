import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/providers/theme_provider.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';

import 'Core/root_manager.dart';
import 'Core/utiles/constance/app_styles.dart';

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
          initialRoute: Routes.homeRoute,
        );
      }),
    );
  }
}
