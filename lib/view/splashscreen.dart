import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var value = sp.getBool("login");
    if (value == true) {
      Timer(const Duration(seconds: 3), () {
        Get.to(() => const HomeScreen());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.to(() => const LoginScreen());
      });
    }
  }

  @override
  void initState() {
    checkLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/earth.jpg",
                    ),
                    fit: BoxFit.fill)),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 250.w,
                ),
              ),
            )),
      ),
    );
  }
}
