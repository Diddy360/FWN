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

class Volunteer extends StatefulWidget {
  const Volunteer({super.key});

  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
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
                            children: [
                              Text(
                                "WE NEED SOME INFORMATION",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "Fill the information below so we can help you get started on this request",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.sp),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "User Name",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
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
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Gender",
                                        hintStyle:
                                            const TextStyle(color: Colors.white),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Age",
                                        hintStyle:
                                            const TextStyle(color: Colors.white),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Contact Number",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
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
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Location",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
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
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Bio",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15.r)),
                                width: 150.w,
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
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
