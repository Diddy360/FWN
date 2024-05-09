import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:fwn/view/registration_screen.dart';
import 'package:fwn/view/support_us.dart';
import 'package:get/get.dart';

class ThankuPage extends StatefulWidget {
  const ThankuPage({super.key});

  @override
  State<ThankuPage> createState() => _ThankuPageState();
}

class _ThankuPageState extends State<ThankuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150.h,
                width: double.infinity,
                color: Colors.black.withOpacity(0.8),
                child: Center(
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
               InkWell(
                  onTap: () => Get.to(() => const HomeScreen()),
                  child: const Text("Home")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const RegistrationScreen()),
                  child: const Text("Registration")),
              const Divider(),
              InkWell(
                  onTap: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text("Login")),
              const Divider(),
              const InkWell(child: Text("News")),
              const Divider(),
              const InkWell(child: Text("Wether")),
              const Divider(),
              const InkWell(child: Text("Forecasting")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const SupportUs()),
                  child: const InkWell(child: Text("Support us"))),
              const Divider(),
              const InkWell(child: Text("Notification")),
            ],
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,

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
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 45.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/logo.png",
                            ),
                            Text(
                              "FWN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {
                                _openEndDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 22.sp,
                              ),
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 170.h,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.white.withOpacity(0.6),
                                  ],
                                ),
                                color: Colors.black.withOpacity(0.4),
                                border: Border.all(
                                    color: Colors.white, width: 0.1.w),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Text(
                                "Thank You!!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 40.h),
                              ),
                            )),
                        SizedBox(
                          height: 100.h,
                        ),
                        InkWell(
                          onTap: () => Get.to(() => const HomeScreen()),
                          child: Container(
                            height: 35.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                    color: Colors.white, width: 0.1.w),
                                color: Colors.red),
                            child: const Center(
                              child: Text(
                                "Back to Home",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
