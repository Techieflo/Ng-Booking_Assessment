import 'dart:async';
import 'package:assessment/controllers/auth_controller.dart';
import 'package:assessment/views/dashboard.dart';
import 'package:assessment/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final AuthController userController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () async {
      bool isLoggedIn = await userController.checkLoginStatus();
      if (isLoggedIn) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String username = prefs.getString('username') ?? '';
        Get.off(() => Dashboard(token: username));
      } else {
        Get.off(() => OnboardingScreen());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/splash_image.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
