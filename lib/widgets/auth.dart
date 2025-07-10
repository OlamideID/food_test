import 'package:flutter/material.dart';
import 'package:food_test/screens/login.dart';
import 'package:food_test/screens/signup.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isLoginScreen = true;

  void toggleScreen() {
    setState(() {
      isLoginScreen = !isLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoginScreen
        ? LoginScreen(onSwitchToSignup: toggleScreen)
        : SignupScreen(onSwitchToLogin: toggleScreen);
  }
}
