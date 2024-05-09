import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/contact_us.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/redeem_rewards.dart';
import 'package:get/get.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:fwn/view/map_screen.dart';
import 'package:fwn/view/news_screen.dart';
import 'package:fwn/view/notification_screen.dart';
import 'package:fwn/view/support_us.dart';
import 'package:fwn/view/wether_Page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                  onTap: () => Get.to(() => const MapScreen()), child: const Text("Map")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const NewsScreen()), child: const Text("News")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const WetherPage()),
                  child: const Text("Wether")),
              const Divider(),
              const InkWell(child: Text("Forecasting")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const SupportUs()),
                  child: const InkWell(child: Text("Support us"))),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const NotificationPage()),
                  child: const Text("Notification")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const SettingPage()),
                  child: const Text("Settings")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const LoginScreen()),
                  child: const Text("Logout")),
            ],
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(1),
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
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              border:
                                  Border.all(color: Colors.white, width: 0.1.w),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30.r,
                                backgroundColor: Colors.white,
                                child: const Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 200.w,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.5),
                                        Colors.white.withOpacity(0.6),
                                      ],
                                    ),
                                    // border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                  child: Text(
                                    "See Your Volunteering",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () => Get.to(const RedeemRewards()),
                                child: Container(
                                  width: 200.w,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.white.withOpacity(0.6),
                                        ],
                                      ),
                                      // border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                    child: Text(
                                      "Redeem Rewards",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () => Get.to(() => const ContactUs()),
                                child: Container(
                                  width: 200.w,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.white.withOpacity(0.6),
                                        ],
                                      ),
                                      // border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                    child: Text(
                                      "Contact Us",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 200.w,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.5),
                                        Colors.white.withOpacity(0.6),
                                      ],
                                    ),
                                    // border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                  child: Text(
                                    "Report Problem",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
