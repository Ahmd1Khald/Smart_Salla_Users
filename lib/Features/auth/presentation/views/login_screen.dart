import 'package:flutter/material.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/background.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/main_contanir.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const BaskGroundWidget(),
              MainContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
