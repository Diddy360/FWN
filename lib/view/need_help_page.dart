import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/thanku_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:fwn/view/map_screen.dart';
import 'package:fwn/view/news_screen.dart';
import 'package:fwn/view/notification_screen.dart';
import 'package:fwn/view/setting_page.dart';
import 'package:fwn/view/support_us.dart';
import 'package:fwn/view/wether_Page.dart';

class NeedHelpPage extends StatefulWidget {
  const NeedHelpPage({super.key});

  @override
  State<NeedHelpPage> createState() => _NeedHelpPageState();
}

class _NeedHelpPageState extends State<NeedHelpPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  Future<void> saveUserData({
    required String username,
    required String gender,
    required String age,
    required String email,
    required String contactNumber,
    required String location,
    required String address,
  }) async {
    // Reference to the collection where data will be stored
    CollectionReference users = FirebaseFirestore.instance.collection('help');

    // Get the current time
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    // Call the 'add' method to save data to the collection
    return users.add({
      'username': username,
      'gender': gender,
      'age': age,
      'email': email,
      'contactNumber': contactNumber,
      'location': location,
      'address': address,
      'timestamp': formattedTime, // Add the current time here
    }).then((value) {
      Get.to(() => const ThankuPage());
    }).catchError((error) => print("Failed to add user: $error"));
  }

  var userName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var age = TextEditingController();
  var gender = TextEditingController();
  var location = TextEditingController();
  var address = TextEditingController();
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
                                controller: userName,
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
                                      controller: gender,
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
                                      controller: age,
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
                                controller: phone,
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
                                controller: email,
                                decoration: InputDecoration(
                                  hintText: "Email",
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
                                controller: location,
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
                                controller: address,
                                decoration: InputDecoration(
                                  hintText: "Address",
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
                              InkWell(
                                onTap: () => saveUserData(
                                    username: userName.text,
                                    gender: gender.text,
                                    age: age.text,
                                    email: email.text,
                                    contactNumber: phone.text,
                                    location: location.text,
                                    address: address.text),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
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
