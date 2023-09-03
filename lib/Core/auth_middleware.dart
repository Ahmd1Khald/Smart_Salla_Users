import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salla_users/Features/auth/presentation/views/login_screen.dart';

import '../Features/root_screens/presentaiton/views/root_screens.dart';

class AuthMiddleWare {
  static StreamBuilder loginMiddleware() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const RoutScreens();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
