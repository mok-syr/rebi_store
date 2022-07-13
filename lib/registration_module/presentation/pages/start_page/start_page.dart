import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../layout/home_layout/home_layout.dart';
import '../../../../screens/splash_screen/splash_screen.dart';
import '../../get_x/auth_controller.dart';
import '../email_verification/email_verification.dart';
import '../signin/signin.dart';
import '../signup/signup.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final AuthController _registerController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<User?>(
        stream: _registerController.userChangesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.emailVerified) {
              return const HomeLayout();
            } else {
              if (snapshot.data!.email != null) {
                return EmailVerificationPage(email: snapshot.data!.email!,);
              }
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          return const _RegisterLayout();
        },
      ),
    );
  }
}

class _RegisterLayout extends StatelessWidget {
  const _RegisterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        if (controller.authPage == AuthPage.signup) {
          return const SignupPage();
        }
        return const SigninPage();
      },
    );
  }
}
