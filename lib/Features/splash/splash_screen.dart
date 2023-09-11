import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:salla_users/Features/auth/presentation/views/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/bag/order.png',
      splashIconSize: 90,
      nextScreen: const LoginScreen(),
      backgroundColor: Colors.orangeAccent,
      curve: Curves.bounceInOut,
      splashTransition: SplashTransition.slideTransition,
      //pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
