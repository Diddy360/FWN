import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:fwn/view/map_screen.dart';
import 'package:fwn/view/news_screen.dart';
import 'package:fwn/view/notification_screen.dart';
import 'package:fwn/view/setting_page.dart';
import 'package:fwn/view/support_us.dart';
import 'package:fwn/view/wether_Page.dart';
import 'package:get/get.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: "Fwn@gmail.com",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: "+1-23456789",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText:
                                      "123 main street anytown USA 123456",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 120.h,
                              ),
                              Center(
                                child: Container(
                                  height: 40.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade400,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.copyright,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "FWN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ),
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
